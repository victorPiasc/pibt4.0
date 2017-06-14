function initPage()
{
	initNav();
	setTimeout(function(){initTabs();},100);
}
function initNav()
{
	if (typeof document.body.style.maxHeight == 'undefined')
	{
		var nav = document.getElementById("nav");
		if(nav)
		{
			var lis = nav.getElementsByTagName("li");
			for (var i=0; i<lis.length; i++)
			{
				lis[i].onmouseover = function()
				{
					this.className += " hover";
				}
				lis[i].onmouseout = function()
				{
					this.className = this.className.replace(" hover", "");
				}
			}
		}
	}
}
function initTabs()
{
	var sets = document.getElementsByTagName("ul");
	for (var i = 0; i < sets.length; i++)
	{
		if (sets[i].className.indexOf("tabset") != -1)
		{
			var tabs = [];
			var links = sets[i].getElementsByTagName("a");
			for (var j = 0; j < links.length; j++)
			{
				if (links[j].className.indexOf("tab") != -1)
				{
					tabs.push(links[j]);
					links[j].tabs = tabs;
					var c = document.getElementById(links[j].href.substr(links[j].href.indexOf("#") + 1));
					
					if (c) if (links[j].className.indexOf("active") != -1) c.style.display = "block";
					else c.style.display = "none";

					links[j].onclick = function ()
					{
						var c = document.getElementById(this.href.substr(this.href.indexOf("#") + 1));
						if (c)
						{
							for (var i = 0; i < this.tabs.length; i++)
							{
								var tab = document.getElementById(this.tabs[i].href.substr(this.tabs[i].href.indexOf("#") + 1));
								if (tab)
								{
									tab.style.display = "none";
								}
								this.tabs[i].className = this.tabs[i].className.replace("active", "");
							}
							this.className += " active";
							c.style.display = "block";
							return false;
						}
					}
				}
			}
		}
	}
}
if (window.addEventListener) 
	window.addEventListener("load", initPage, false);
else if (window.attachEvent) 
	window.attachEvent("onload", initPage);