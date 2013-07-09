using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using YardeCart.Data;

namespace YardeCart.Business
{
    public class Category
    {
        public DataTable SelectCategory()
        {
            DALComponent dalCom = new DALComponent();
            dalCom.SqlCommandText = "SelectCategory";
            return dalCom.SelectRecord();
        }
    }
}
