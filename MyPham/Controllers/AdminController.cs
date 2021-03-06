﻿using MyPham.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace MyPham.Controllers
{
    public class AdminController : Controller
    {
        DbMyPhamDataContext db = new DbMyPhamDataContext();

        public void login()
        {
            Response.StatusCode = 404;
            //return null;
        }

        
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            return View();
        }

        public ActionResult DSkhachhang(int? page)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            int pageNum = (page ?? 1);
            int pageSize = 30;
            var s = from f in db.KhachHangs select f;
            if(s == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else
                return View(s.OrderBy(n => n.TenKH).ToPagedList(pageNum, pageSize));
        }

        public ActionResult SanPham(int ? page)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            int pageNum = (page ?? 1);
            int pageSize = 10;
            return View(db.SanPhams.ToList().OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));

        }

        [HttpPost]
        public ActionResult SearchSP(string SearchSP, int? page)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            List<SanPham> kqTk = db.SanPhams.Where(n => n.TenSP.Contains(SearchSP)).ToList();

            int pageSize = 10;
            int pageNum = (page ?? 1);

            if (kqTk.Count == 0)
            {
                
                return RedirectToAction("Sanpham");
            }
            else
            {
                ViewBag.KQsp = kqTk.Count.ToString();
                return View(kqTk.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
        }
        //-----------------------------------------------------------------------------------------------------------------
        [HttpPost]
        public ActionResult SearchKH(string SearchKH, int? page)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            List<KhachHang> kqTk = db.KhachHangs.Where(n => n.TenKH.Contains(SearchKH)).ToList();

            int pageSize = 10;
            int pageNum = (page ?? 1);

            if (kqTk.Count == 0)
            {

                return RedirectToAction("DSkhachhang");
            }
            else
            {
                ViewBag.KQkh = kqTk.Count.ToString();
                return View(kqTk.OrderBy(n => n.TenKH).ToPagedList(pageNum, pageSize));
            }
        }
        //------------------------------------------------------------------------------------------------------

        public ActionResult CTDH(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }
            var c = from s in db.ChiTietDDHs where s.MaDH == id select s;
            return View(c);
        }
        
        public ActionResult QLdonhang(int? page)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            int pageNum = (page ?? 1);
            int pageSize = 30;
            var s = from f in db.DonDatHangs where f.TinhTrangGiaoHang == false || f.DaThanhToan == false select f;
            return View(s.ToPagedList(pageNum, pageSize));

        }
        /// <summary>
        /// sua tinh trang giao hang, tinh trang thanh toan
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult TinhtrangDDH(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }
            MaDDH = id;
            DonDatHang d = db.DonDatHangs.SingleOrDefault(n => n.MaDH == id);
            if(d == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(d);
        }
        private int MaDDH=0;
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult TinhtrangDDH(DonDatHang dh)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }
            DonDatHang d = db.DonDatHangs.SingleOrDefault(n => n.MaDH == dh.MaDH);
            d.TinhTrangGiaoHang = dh.TinhTrangGiaoHang;
            d.DaThanhToan = dh.DaThanhToan;
            

            if (d.TinhTrangGiaoHang == true && d.DaThanhToan == true)
            {
                var c = from s in db.ChiTietDDHs where s.MaDH == MaDDH select s;

                foreach(var n in c)
                {
                    SanPham s = db.SanPhams.SingleOrDefault(o => o.MaSP == n.MaSP);
                    s.SoLuongTon = s.SoLuongTon - n.SoLuong;
                }

                db.SubmitChanges();
            }
            db.SubmitChanges();
            return RedirectToAction("QLdonhang");
        }
        /// <summary>
        /// xoa don dat hang, voi tham so truyen vao la MaDDH
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult XoaDDH(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            DonDatHang d = db.DonDatHangs.SingleOrDefault(n => n.MaDH == id);
            if(d == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else
            {
                return View(d);
            }
        }
        [HttpPost, ActionName("XoaDDH")]
        public ActionResult XacnhanXoaDDH(int id)
        {

            DonDatHang d = db.DonDatHangs.SingleOrDefault(n => n.MaDH == id);
            if(d == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else
            {
                db.DonDatHangs.DeleteOnSubmit(d);
                db.SubmitChanges();
                return RedirectToAction("QLdonhang");
            }
        }
        //--------------------------------------------------------
        public ActionResult DSdonhang(int? page)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            int pageNum = (page ?? 1);
            int pageSize = 30;
            var s = from f in db.DonDatHangs where f.TinhTrangGiaoHang == true || f.DaThanhToan == true select f;
            return View(s.OrderByDescending(n => n.NgayGiao).ToPagedList(pageNum, pageSize));

        }
        //----------------------------------------------------------------
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        //-------------------------------------------------
        // lấy username cua admin
        private static String tenAdmin;
       
        [HttpPost]
        public ActionResult Login(FormCollection col)
        {
            var UserName = col["username"];
            var pwd = col["Pwd"];
            String x = col["username"];

            Admin ad = db.Admins.SingleOrDefault(n => n.NameUser == UserName && n.PwdUser == pwd);
            if (ad != null)
            {
                tenAdmin = x;
                Session["TaikhoanAdmin"] = ad;
                return RedirectToAction("index", "Admin");
            }
            else
            {
                ViewBag.thongbao = "UserName hoặc Password không đúng";
            }

            return View();
        }

        public ActionResult Logout()
        {
            Session["TaikhoanAdmin"] = null;
            return RedirectToAction("Login");
        }

        [HttpGet]
        public ActionResult CreateSp()
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateSp(SanPham sp, HttpPostedFileBase fileUp)
        {
            
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            if (fileUp == null)
            {
                ViewBag.thongbao = "Cần phải chèn ảnh sản phẩm!";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(fileUp.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), filename);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        fileUp.SaveAs(path);
                    }
                    sp.HinhAnh= filename;
                    sp.Admin = ((Admin)(Session["TaikhoanAdmin"])).NameUser; // tenAdmin của t là 1 chuỗi nhưng nó thêm vào là null
                    sp.NgayCapNhat = DateTime.Now;
                    sp.SoLuongTon = 0;
                    db.SanPhams.InsertOnSubmit(sp);
                    db.SubmitChanges();
                }
            }
            return RedirectToAction("SanPham");
        }

        //------------------------------------------
        public ActionResult ChitietSp(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            SanPham Sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSp = Sp.MaSP;
            if (Sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(Sp);
        }

        [HttpGet]
        public ActionResult SuaSp(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);

            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.MaNSX), "MaNSX", "TenNSX",sp.MaNSX);
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.MaLoai), "MaLoai", "TenLoai",sp.MaLoai);

            return View(sp);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaSp(SanPham sp, HttpPostedFileBase fileUp)
        {
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
            ViewBag.MaLoai = new SelectList(db.LoaiSPs.ToList().OrderBy(n => n.MaLoai), "MaLoai", "TenLoai");
            if (fileUp == null)
            {
                SanPham newsp = db.SanPhams.SingleOrDefault(n => n.MaSP == sp.MaSP);
                newsp.TenSP = sp.TenSP;
                newsp.GiaBan = sp.GiaBan;
                newsp.MoTa = sp.MoTa;
                newsp.Admin = ((Admin)(Session["TaikhoanAdmin"])).NameUser; // tenAdmin của t là 1 chuỗi nhưng nó thêm vào là null
                newsp.NgayCapNhat = DateTime.Now;
                newsp.MaLoai = sp.MaLoai;
                newsp.MaNSX = sp.MaNSX;
                db.SubmitChanges();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(fileUp.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), filename);
                    //if (System.IO.File.Exists(path))
                    //{
                    //    ViewBag.thongbao = "Hình ảnh đã tồn tại";
                        
                    //}
                    //else
                    //{
                        fileUp.SaveAs(path);
                        SanPham newsp = db.SanPhams.SingleOrDefault(n => n.MaSP == sp.MaSP);
                        newsp.TenSP = sp.TenSP;
                        newsp.GiaBan = sp.GiaBan;
                        newsp.MoTa = sp.MoTa;
                        newsp.HinhAnh = filename;
                        newsp.Admin = ((Admin)(Session["TaikhoanAdmin"])).NameUser; // tenAdmin của t là 1 chuỗi nhưng nó thêm vào là null
                        newsp.NgayCapNhat = DateTime.Now;
                        newsp.MaLoai = sp.MaLoai;
                        newsp.MaNSX = sp.MaNSX;
                        db.SubmitChanges();
                    //}
                }
            }
            return RedirectToAction("SanPham");
        }

        //----------------------------------------------------------
        [HttpGet]
        public ActionResult nhapkho(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);

            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult nhapkho(SanPham sp)
        {
            if (sp.SoLuongTon > 0)
            {
                SanPham newsp = db.SanPhams.SingleOrDefault(n => n.MaSP == sp.MaSP);
                //newsp.NgayCapNhat = sp.NgayCapNhat;
                newsp.SoLuongTon = newsp.SoLuongTon + sp.SoLuongTon;
                db.SubmitChanges();
            }
            else
            {
            }
            return RedirectToAction("SanPham");

        }
        //----------------------------------------------------------
        [HttpGet]
        public ActionResult XoaSp(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSp = sp.MaSP;
            if(sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        //----------------------------------------------
        [HttpPost, ActionName("XoaSp")]
        public ActionResult Xacnhanxoa(int id)
        {
            if (Session["TaikhoanAdmin"] == null)
            {
                login();
                return null;
            }

            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSp = sp.MaSP;
            if(sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SanPhams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("sanpham");
        }
        //-----------------------------------------------
        
    }
}