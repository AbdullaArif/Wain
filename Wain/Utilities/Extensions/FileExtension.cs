namespace Wain.Utilities.Extensions
{
    public static class FileExtension
    {
        public static bool CheckFileType(this IFormFile formFile, string type)
        {
            if (formFile.ContentType.Contains(type))
            {
                return true;
            }
            return false;
        }
        public static bool CheckFileSize(this IFormFile formFile, int kb)
        {
            if (formFile.Length <= kb * 1024)
            {
                return true;
            }
            return false;
        }
        public static async Task<string> CreateFileAsync(this IFormFile formFile, string root, string folder)
        {
            string filename = Guid.NewGuid().ToString() + formFile.FileName;

            string path = Path.Combine(root, folder, filename);

            using (FileStream stream = new FileStream(path, FileMode.Create))
            {
                await formFile.CopyToAsync(stream);
            };
            return filename;
        }
        public static void DeleteFile(this string fileName, string root, string folder)
        {
            string path = Path.Combine(root, folder, fileName);

            if (File.Exists(path))
            {
                File.Delete(path);
            }
        }
    }
}
