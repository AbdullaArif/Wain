using System.ComponentModel.DataAnnotations.Schema;

namespace Wain.Models
{
    public class RentalCalculatorModel
    {
        [NotMapped]
            public decimal CarPrice { get; set; }
            public int RentalDays { get; set; }
        
    }
}
