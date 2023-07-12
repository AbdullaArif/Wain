using Microsoft.EntityFrameworkCore;
using Wain.DAL;
using Wain.Models;

namespace Wain.Service
{
    public class LayoutService:BaseEntity
    {
        private readonly AppDbContext _context;

        public LayoutService(AppDbContext context)
        {
            _context = context;
        }
        public async Task<Dictionary<string, string>> SettingsAsync()
        {
            Dictionary<string, string> settings = await _context.Settings.ToDictionaryAsync(s => s.Key, s => s.Value);

            return settings;
        }
    }
}
