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

        public DataTable SelectCategoryGroup()
        {
            DALComponent dalComponent = new DALComponent();
            dalComponent.SqlCommandText = "SelectCategoryGroup";
            return dalComponent.SelectRecord();
        }

        public int CategoryUpdate(int catid, string catname, int groupid)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();

                dalComponent.SetParameters("@categoryId", SqlDbType.Int, 4, catid);
                dalComponent.SetParameters("@categoryName", SqlDbType.VarChar, 50, catname);
                dalComponent.SetParameters("@categoryGroupId", SqlDbType.Int, 4, groupid);
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

        public int CategoryGroupUpdate(int catid, string catname)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();

                dalComponent.SetParameters("@categoryGroupId", SqlDbType.Int, 4, catid);
                dalComponent.SetParameters("@categoryGroupName", SqlDbType.VarChar, 100, catname);
                dalComponent.SqlCommandText = "CategoryGroupUpdate";
                int x = dalComponent.CreateRecord();
                return x;
            }
            catch (Exception)
            {
                throw;
            }
            return 0;
        }

        public void CategoryGroupDelete(int catid)
        {
            try
            {
                DALComponent dalComponent = new DALComponent();
                dalComponent.SetParameters("@categoryGroupId", SqlDbType.Int, 4, catid);
                dalComponent.SqlCommandText = "CategoryGroupDelete";
                int x = dalComponent.DeleteRecord();
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
