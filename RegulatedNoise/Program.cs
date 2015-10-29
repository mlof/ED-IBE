﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.Xml;
using System.Xml.Serialization;
using RegulatedNoise.EDDB_Data;
using RegulatedNoise.Web;
using RegulatedNoise.SQL;
using RegulatedNoise.MTCommandersLog;
using RegulatedNoise.MTPriceAnalysis;
using RegulatedNoise.MTSettings;

namespace RegulatedNoise
{
    public static class Program
    {

        public const Decimal DB_VERSION_CURRENT     = 1.0M;
        public const Decimal DB_VERSION_NONE        = 0.0M; 

        public const String NULLSTRING              = "?";
        public const String COMMODITY_NOT_SET       = "???";
        public const String BASE_LANGUAGE           = "eng";



#region enums

        public enum enVisitedFilter
        {
            showAll                 = 0,
            showOnlyVistedSystems   = 1,
            showOnlyVistedStations  = 2
        }

#endregion


        #region main object creation and disposing

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
            Application.ThreadException += Application_ThreadException;

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            Init();

            
            Application.Run(new Form1());

            Cleanup();

        }

        #endregion

    #region Exception Handling

        static void Application_ThreadException(object sender, ThreadExceptionEventArgs e)
        {
            HandleException(e.Exception);
        }

        static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            HandleException((Exception)(e.ExceptionObject));
        }


        private static void HandleException(Exception ex)
        {
            if (ex == null)
                return;
            // ExceptionPolicy.HandleException(ex, "Default Policy");
            CreateMiniDump();
            MessageBox.Show("Fatal error.\r\n\r\nA dump file (\"RegulatedNoiseDump.dmp\" has been created in your RegulatedNoise directory.  \r\n\r\nPlease place this in a file-sharing service such as Google Drive or Dropbox, then link to the file in the Frontier forums or on the GitHub archive.  This will allow the developers to fix this problem.  \r\n\r\nThanks, and sorry about the crash...");
            Application.Exit();
        }

        // From http://brakertech.com/howto-c-generate-dump-file-on-crash/
        public class MINIDUMP_TYPE
        {
            public const int MiniDumpNormal = 0x00000000;
            public const int MiniDumpWithDataSegs = 0x00000001;
            public const int MiniDumpWithFullMemory = 0x00000002;
            public const int MiniDumpWithHandleData = 0x00000004;
            public const int MiniDumpFilterMemory = 0x00000008;
            public const int MiniDumpScanMemory = 0x00000010;
            public const int MiniDumpWithUnloadedModules = 0x00000020;
            public const int MiniDumpWithIndirectlyReferencedMemory = 0x00000040;
            public const int MiniDumpFilterModulePaths = 0x00000080;
            public const int MiniDumpWithProcessThreadData = 0x00000100;
            public const int MiniDumpWithPrivateReadWriteMemory = 0x00000200;
            public const int MiniDumpWithoutOptionalData = 0x00000400;
            public const int MiniDumpWithFullMemoryInfo = 0x00000800;
            public const int MiniDumpWithThreadInfo = 0x00001000;
            public const int MiniDumpWithCodeSegs = 0x00002000;
        }

        [DllImport("dbghelp.dll")]
        public static extern bool MiniDumpWriteDump(IntPtr hProcess,
                                                    Int32 ProcessId,
                                                    IntPtr hFile,
                                                    int DumpType,
                                                    IntPtr ExceptionParam,
                                                    IntPtr UserStreamParam,
                                                    IntPtr CallackParam);

        public static void CreateMiniDump()
        {
            CreateMiniDump("RegulatedNoiseDump.dmp");
        }

        public static void CreateMiniDump(string Filename)
        {
            using (FileStream fs = new FileStream(".//" + Filename, FileMode.Create))
            {
                using (System.Diagnostics.Process process = System.Diagnostics.Process.GetCurrentProcess())
                {
                    MiniDumpWriteDump(process.Handle,
                                                     process.Id,
                                                     fs.SafeFileHandle.DangerousGetHandle(),
                                                     MINIDUMP_TYPE.MiniDumpWithFullMemory,
                                                     IntPtr.Zero,
                                                     IntPtr.Zero,
                                                     IntPtr.Zero);
                }
            }
        }

    #endregion// Exception Handling

    #region global objects

        private static Boolean                          m_initDone                  = false;

        public static CompanionInterface                CompanionIO;
        public static DBConnector                       DBCon;
        public static RegulatedNoiseSettings            Settings_old;
        private static DBProcess                        EliteDBProcess;
        public static Settings                          Settings;
        public static CommandersLog                     CommandersLog;
        public static PriceAnalysis                     PriceAnalysis;
        public static EliteDBIO                         Data;
        public static Condition                         actualCondition;


        /// <summary>
        /// starts the initialization of the global objects
        /// </summary>
        public static void Init()
        {

            try
            {
                if(!m_initDone)
                { 
                    // loading settings from file
                    Settings_old = RegulatedNoiseSettings.LoadSettings();


                    // starting database process (if not running)
                    DBProcess.DBProcessParams newProcessParams = new DBProcess.DBProcessParams() { };
                    newProcessParams.Commandline                = Settings_old.SQL_Commandline;    
                    newProcessParams.Commandargs                = Settings_old.SQL_CommandArgs;
                    newProcessParams.Workingdirectory           = Settings_old.SQL_Workingdirectory;
                    newProcessParams.Port                       = Settings_old.SQL_Port;
                    newProcessParams.DBStartTimeout             = Settings_old.DBStartTimeout;
                
                    EliteDBProcess                              = new DBProcess(newProcessParams);


                    // connecting to the database
                    DBConnector.ConnectionParams newConnectionParams = new DBConnector.ConnectionParams() { };

                    newConnectionParams.Name                    = Settings_old.SQL_Name;    
                    newConnectionParams.Server                  = Settings_old.SQL_Server;
                    newConnectionParams.Database                = Settings_old.SQL_Database;
                    newConnectionParams.User                    = Settings_old.SQL_User;
                    newConnectionParams.Pass                    = Settings_old.SQL_Pass;
                    newConnectionParams.ConnectTimeout          = Settings_old.SQL_TimeOut;
                    newConnectionParams.StayAlive               = Settings_old.SQL_StayAlive;
                    newConnectionParams.TimeOut                 = Settings_old.SQL_ConnectTimeout;

                    DBCon                                       = new DBConnector(newConnectionParams);

                    DBCon.Connect();

                    // preprare main data object
                    Data                                        = new RegulatedNoise.SQL.EliteDBIO();
                    Data.PrepareBaseTables();

                    // prepare settings
                    Settings                                    = new Settings();
                    Settings.BaseData                           = Data.BaseData;

                    // prepare commanders log 
                    CommandersLog                               = new CommandersLog();
                    CommandersLog.BaseData                      = Data.BaseData;

                    // prepare price analysis 
                    PriceAnalysis                               = new PriceAnalysis();
                    PriceAnalysis.BaseData                      = Data.BaseData;

                    // initializing the Companion-Interface
                    //CompanionIO         = new CompanionInterface();
                    CompanionIO = null;

                    // initializing the object for the actual condition
                    actualCondition = new Condition();

                    m_initDone = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error while initializing the program object", ex);
            }

        }

        public static void Cleanup()
        { 
            if(DBCon != null)
            { 
                DBCon.Dispose();
                DBCon = null;
            }

            if(EliteDBProcess != null)
            { 
                EliteDBProcess.Dispose();
                EliteDBProcess = null;
            }
        }

    #endregion //global objects

    }
}
