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
    
        public DataTable SelectCityByName(string cityname)
        {
            DALComponent dalCom = new DALComponent();
            dalCom.SetParameters("@cityname", SqlDbType.VarChar, 50, cityname);
            dalCom.SqlCommandText = "[SelectCityByName]";
            return dalCom.SelectRecord();
        }

        public DataTable SelectCityById(string cityid)
        {
            DALComponent dalCom = new DALComponent();
            dalCom.SetParameters("@cityid", SqlDbType.Int, 4, cityid);
            dalCom.SqlCommandText = "[SelectCityById]";
            return dalCom.SelectRecord();
        }

    
    }
}
