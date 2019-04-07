using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyPham.Models;
using PagedList.Mvc;
using PagedList;

namespace MyPham.Controllers
{
    public class AdLoaiSPController : Controller
    {
        DbMyPhamDataContext db = new DbMyPhamDataContext();
        // GET: AdLoaiSP
        public ActionResult QLloaisp()
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            return View(db.LoaiSPs.OrderBy(n => n.TenLoai));
        }


        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(LoaiSP l)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }
            db.LoaiSPs.InsertOnSubmit(l);
            db.SubmitChanges();
            return RedirectToAction("QLloaiSP");
        }


        [HttpGet]
        public ActionResult Delete(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }
            LoaiSP l = db.LoaiSPs.SingleOrDefault(n => n.MaLoai == id);
            if(l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View();
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult Xoa(int id)
        {
            LoaiSP l = db.LoaiSPs.SingleOrDefault(n => n.MaLoai == id);
            if(l == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.LoaiSPs.DeleteOnSubmit(l);
            db.SubmitChanges();
            return RedirectToAction("QLloaiSP");
        }
        public void login()
        {
            Response.StatusCode = 404;
            //return null;
        }

        //author: Tien
        public void Test()
        {
            //we will add code here to test application
			//Code change in local

            //Change code on Host
 
        }

    }
}
