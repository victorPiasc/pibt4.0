using System;

namespace Pibt
{
    public partial class NewsDetails: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
           Response.Redirect("/News.aspx");
        }
    }
}