using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for products
/// </summary>
public class items
{
    public List<items> product_list = new List<items>();
     
    public string pid { get; set; }

    public string category { get; set; }

    public string pname { get; set; }

    public string price { get; set; }

    public string img { get; set; }


    public int Qty { get; set; }






    public items(string pid, string category, string pname, string price, string img)
    {
        this.pid = pid;
        this.category = category;
        this.pname = pname;
        this.price = price;
        this.img = img;
        this.Qty = 1;
        

    }

}