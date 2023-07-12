namespace Wain.Models
{
    public class Car : BaseEntity
    {
        public Car()
        {
            CarImages = new List<CarImage>();
        }
        public string Brand { get; set; }
        public string Model { get; set; }
        public int GraduationYear { get; set; }
        public string Engine { get; set; }
        public decimal March { get; set; }
        public decimal Price { get; set; }
        public string Transmission { get; set; }
        public string Location { get; set; }
        public int HorsePower { get; set; }
        public string Description { get; set; }
        public bool IsRent { get; set; }

        //One To Many
        public int AgentId { get; set; }
        public Agent Agent { get; set; }

        public int BodyStyleId { get; set; }
        public BodyStyle BodyStyle { get; set; }

        public int FuelTypeId { get; set; }
        public FuelType FuelType { get; set; }

        public int ColorId { get; set; }
        public Color Color { get; set; }


        public List<CarImage>? CarImages { get; set; }


    
    }
}
