using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Primitives;

namespace MyWebApp.Pages.Videos
{
    public class VideoPlayerModel : PageModel
    {
        public string VideoName { get; private set; } = "unknown"; // Default value

        public void OnGet()
        {
            // Convert StringValues to string and set a default value if null or empty
            VideoName = Request.Query.TryGetValue("name", out StringValues value) && !string.IsNullOrEmpty(value)
                ? value.ToString()
                : "unknown";
        }
    }
}
