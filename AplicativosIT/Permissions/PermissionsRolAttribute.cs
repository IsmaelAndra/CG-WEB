using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AplicativosIT.Models;

namespace AplicativosIT.Permissions
{
    public class PermissionsRolAttribute : ActionFilterAttribute
    {
        private Rol rol;
        public PermissionsRolAttribute(Rol _rol)
        {
            rol = _rol;
        }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["User"] != null)
            {
                Users user = HttpContext.Current.Session["User"] as Users;
                if (user.rol != this.rol)
                {
                    filterContext.Result = new RedirectResult("~/Home/SinPermiso");
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}