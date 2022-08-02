using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Domain.Friends
{
    public class Friend
    {
        public int SenderId { get; set; }
        public int RecipientId { get; set; }
        public int StatusId { get; set; }
    }
}
