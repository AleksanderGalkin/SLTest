﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel;
using SLTest.Models.Interface;

namespace SLTest.Models
{
    [MetadataType(typeof(RecipeValidation))]
    public partial class Recipe:IBase
    {
        //public String fID
        //{
        //    get
        //    {
        //        return "RecID";
        //    }
        //}
        //public String fName
        //{
        //    get
        //    {
        //        return "RecName";
        //    }
        //}

        [Bind(Exclude = "RecID")]
        public class RecipeValidation
        {
            [ScaffoldColumn(false)]
            public Int64 RecID { get; set; }

            [DisplayName("Напиток")]
            [Required(ErrorMessage="Это обязательное поле")]
            [DisplayFormat(ConvertEmptyStringToNull=false)]
            [StringLength(50)]
            public string RecName { get; set; }

            [DisplayName("Цена")]
            [Required(ErrorMessage = "Это обязательное поле")]
            [DisplayFormat(DataFormatString = "{0:F2}", ApplyFormatInEditMode=true)]
            [Range(0.0,3000.0,ErrorMessage="Цена от 0.00 до 3000.00")]
            public decimal Price { get; set; }

            [DisplayName("Описание")]
            [Required(ErrorMessage = "Это обязательное поле")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(100)]
            public string Describe { get; set; }
        }
        public bool CanBeDeleted()
        {
            return true;
        }
    }
}