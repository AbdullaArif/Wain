using Wain.Models;

namespace Wain.ViewModels
{
    public class AgentVM
    {
        public decimal CurrentPage { get; set; }
        public decimal TotalPage { get; set; }
        public List<Agent> Agents { get; set; }

        public Agent Agent { get; set; }

        public PaginateVM<Agent> PaginateVMAgent { get; set; }


        //public string Name { get; set; }
        //public string Surname { get; set; }
        //public string Address { get; set; }
        //public string Email { get; set; }
        //public string Mobile { get; set; }
        public string? Image { get; set; }

        //public List<Car>? Car { get; set; }


        //public IFormFile? Photo { get; set; }
    }
}
