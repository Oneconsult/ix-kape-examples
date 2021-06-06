using System.IO;
using System.ServiceProcess;

namespace EvilService
{
    public class EvilService : ServiceBase
    {
        public static void Main()
        {
            ServiceBase.Run(new EvilService());
        }
        
        public EvilService()
        {
            this.ServiceName = "BlTS";
        }

        protected override void OnStart(string[] args)
        {
            base.OnStart(args);

            var proofFile = @"C:\ProgramData\USOShared\proofPrivileged.txt";

            File.AppendAllText(proofFile, "T1543.003 - Windows Service\n");
        }
    }
}
