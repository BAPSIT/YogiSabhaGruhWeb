using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Managers
{
    public interface IUserForm
    {
        UserInfo UserInfo { get; set; }
    }
    public interface IUserListView
    {
        IEnumerable<UserInfo> UserList { get; set; }
    }
    public class UserManager
    {
        private IUserForm userForm;
        private UserOperations userOperations;
        private IUserListView userList;

        public UserManager()
        {
            this.userOperations = new UserOperations();
        }

        public UserManager(IUserForm form)
            : this()
        {
            this.userForm = form;
        }
        public UserManager(IUserListView listView)
            : this()
        {
            this.userList = listView;
        }

        public void InitializeUserList()
        {
            if (this.userList != null)
            {
                userList.UserList = userOperations.GetUserList();
            }
            else
            {
                throw new ArgumentNullException("UserList is null");
            }
        }

        public void InitializeUser(int userNo)
        {
            if (this.userForm != null)
            {
                userForm.UserInfo = this.userOperations.GetUser(userNo);
            }
            else
            {
                throw new ArgumentNullException("User Form is null");
            }
        }

        public void AddOrUpdateUser(UserInfo info)
        {
            userOperations.AddOrUpdateUser(info);
        }

        public void DeleteUser(UserInfo info)
        {
            //this.inventoryOperations.DeleteInventoryInfo(info);
        }

    }
}