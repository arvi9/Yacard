using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using YardeCart.Data;

namespace YardeCart.Business
{
    public class State
    {
        public DataTable SelectState()
        {
            DALComponent dalCom = new DALComponent();
            dalCom.SqlCommandText = "SelectState";
            return dalCom.SelectRecord();
        }
    
    }
}
