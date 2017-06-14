using System;
using Pibt.Common;

namespace Pibt
{
    public partial class ContactUs: SortaBasePage {
        static string iframe =
            "<div class=\"row\">" +
                "<div class=\"column-12\">" +
                    "<div class=\"gmap\">" +
                        "<iframe height=\"280\" width=\"100%\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" " +
                            "src=\"https://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=Printing+Industries+Association,+Inc.+of+Southern+California,+Print" +
                                "ing+Industries+Association,+Inc.+of+Southern+California,+Suite+400,+5800+S+Eastern+Ave,+Commerce,+CA+90040&amp;daddr=&amp;hl=en" +
                                "&amp;geocode=CV-KpmrOdMHiFZKUBgIdL_70-ClP4z3Vis7CgDHPTa53l-dj4Q&amp;aq=&amp;sll=33.98548,-118.16164&amp;sspn=0.012028,0.021029&" +
                                "amp;t=m&amp;mra=pd&amp;ie=UTF8&amp;ll=33.985485,-118.16165&amp;spn=0.006295,0.007592&amp;output=embed\">" +
                        "</iframe>" +
                    "</div>" +
                "</div>" +
                "<div class=\"column-\">" +
                "</div>" +
            "</div>";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Common.Utilities.Us().Equals("PIBT"))
                mapLit.Text = iframe;
        }
    }
}