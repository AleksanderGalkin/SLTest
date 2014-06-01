using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.WebPages.Html;
using System.Web.Mvc;
using System.Text;
using SLTest.Models;

namespace SLTest.Service.Helper
{
    public static class MyPager
    {
        
        
        public static MvcHtmlString PageLinks(this System.Web.Mvc.HtmlHelper HH,PagingInfo paginginfo,Func<int,  string> pageUrl)
        {
            bool flagDots = false;
            StringBuilder result = new StringBuilder();
            for (int i = 1; i <= paginginfo.TotalPages; i++)
            {
                if (i == 1 || i == paginginfo.TotalPages
                    || (i >= paginginfo.CurrentPage - paginginfo.ItemsToView / 2
                    && i <= paginginfo.CurrentPage + paginginfo.ItemsToView / 2))
                {
                    TagBuilder tag = new TagBuilder("a");  
                    tag.MergeAttribute("href", pageUrl(i));
                    tag.InnerHtml = i.ToString();

                    if (i == paginginfo.CurrentPage)
                        tag.AddCssClass("selected");
                    else
                        tag.AddCssClass("allowed");
                    result.Append(tag);
                    result.Append("&nbsp");
                    flagDots = false;
                }
                else if (!flagDots)
                {
                    
                    flagDots = true;
                    result.Append(" ... ");
                    result.Append("&nbsp");
                }
            }
            return MvcHtmlString.Create(result.ToString());
                
            

        }
    }
}