using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using YardeCart.Data;

namespace YardeCart.Business
{
    public class City
    {
        public DataTable SelectCity()
        {
            DALComponent dalCom = new DALComponent();
            dalCom.SqlCommandText = "SelectCity";
            return dalCom.SelectRecord();
        }
    
    }
}
