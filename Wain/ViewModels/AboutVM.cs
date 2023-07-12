using Wain.Models;

namespace Wain.ViewModels
{
    public class AboutVM
    {
       public List<Agent>  Agents { get; set; }
       public List<Car>  Cars { get; set; }
        public List<Models.ServiceCustom> ServiceCustoms { get; set; }
    }
}
