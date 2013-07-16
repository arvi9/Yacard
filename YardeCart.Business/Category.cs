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
            DALComponent dalComponent = new DALComponent();
            dalComponent.SqlCommandText = "SelectCategory";
            return dalComponent.SelectRecord();
        }

        public int CategoryUpdate(int catid,string catname)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();

                dalComponent.SetParameters("@categoryId", SqlDbType.Int, 4, catid);
                dalComponent.SetParameters("@categoryName", SqlDbType.VarChar, 50, catname);
                dalComponent.SqlCommandText = "CategoryEdit";
                int x = dalComponent.CreateRecord();
                return x;
            }
            catch (Exception)
            {
                throw;
            }
            return 0;
        }

        public void CategoryDelete(int catid)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@categoryId", SqlDbType.Int, 4, catid);
                dalComponent.SqlCommandText = "CategoryDelete";
                int x = dalComponent.DeleteRecord();
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
