using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models.Interface;
using SLTest.Service.Interface;
using SLTest.Models;

namespace SLTest.Controllers.Abstract
{
    public abstract class BaseController<T,S>:Controller
        where T:class,IBase,new()
        where S:class,IBaseService<T>

    {
        protected S Service;
        private int itemsPerPage = 3;
        VMMenu<T> vmmenu = new VMMenu<T>();

        public BaseController(S _Service)
        {
            Service = _Service;
        }

        #region Actions

        public virtual ActionResult Index(int pageNum = 1)
        {
            vmmenu.paginginfo.CurrentPage = pageNum;
            vmmenu.paginginfo.ItemsPerPage = itemsPerPage;
            vmmenu.paginginfo.ItemsToView = 3;
            vmmenu.paginginfo.TotalItems = Service.Count();
            //ViewData["PageNum"] = pageNum;
            //ViewData["itemsPerPage"] = itemsPerPage;
            //ViewData["recordCount"] = Service.Count();
            vmmenu.items = Service.GetToPage(pageNum, itemsPerPage);
            return View(vmmenu);
        }
        public virtual ActionResult PVIndex(int pageNum = 1)
        {
            vmmenu.paginginfo.CurrentPage = pageNum;
            vmmenu.paginginfo.ItemsPerPage = itemsPerPage;
            vmmenu.paginginfo.ItemsToView = 3;
            vmmenu.paginginfo.TotalItems = Service.Count();
            //ViewData["PageNum"] = pageNum;
            //ViewData["itemsPerPage"] = itemsPerPage;
            //ViewData["recordCount"] = Service.Count();
            vmmenu.items = Service.GetToPage(pageNum, itemsPerPage);
            return View(vmmenu);
        }
        public virtual ActionResult Create()
        {
            
            return View();
        }
        [HttpPost]
        public virtual ActionResult Create(FormCollection FC)
        {
            if (ModelState.IsValid)
            {
                T obj = new T();
                UpdateModel(obj, FC);
                Service.Create(obj);
                return RedirectToAction("Index");
            }
            else
                return View(FC);
        }
        public virtual ActionResult Edit(int id)
        {
            T obj = Service.Get(id);
       
            return View(obj);
        }
        [HttpPost]
        public virtual ActionResult Edit(int id,FormCollection FC)
        {
            T obj = Service.Get(id);
            UpdateModel(obj, FC);
            Service.Edit(obj);
            return RedirectToAction("Index");
        }
        public virtual ActionResult Delete(int id,FormCollection FC)
        {
            var obj = Service.Get(id);
            Service.Delete(obj);
            return RedirectToAction("Index");
        }


        #endregion
       
    }
}