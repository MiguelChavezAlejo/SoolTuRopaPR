using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using TuRopaPR.TuRopaCD;

namespace TuRopaPR.TuRopaCN
{
    public class AdminCN
    {
        private AdminCD adminCD = new AdminCD();
        public DataTable listarDonaodres()
        {
            return adminCD.listarDonaodres();
        }
        public DataTable listarDonaciones()
        {
            return adminCD.listarDonaciones();
        }
    }
}