using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Requests.Friends
{
    public class FriendRequest
    {
        [Required]
        [Range(1, Int32.MaxValue)]
        public int RecipientId { get; set; }

        [Required]
        [Range(1, Int32.MaxValue)]
        public int StatusId { get; set; }
    }
}
