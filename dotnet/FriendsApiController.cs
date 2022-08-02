using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sabio.Models;
using Sabio.Models.Domain.Friends;
using Sabio.Models.Requests.Friends;
using Sabio.Services;
using Sabio.Services.Friends;
using Sabio.Web.Controllers;
using Sabio.Web.Models.Responses;

namespace Sabio.Web.Api.Controllers
{
    [Route("api/friends")]
    [ApiController]
    public class FriendsApiController : BaseApiController
    {
        private IFriendsServices _service = null;
        private IAuthenticationService<int> _authService = null;

        public FriendsApiController(IFriendsServices service, ILogger<FriendsApiController> logger,
            IAuthenticationService<int> authenticationService) : base(logger)
        {
            _service = service;
            _authService = authenticationService;
        }

        [HttpPost]
        public ActionResult<SuccessResponse> Create(FriendRequest model)
        {
            int code = 201;
            BaseResponse response = null;

            try
            {
                int senderUserId = _authService.GetCurrentUserId();
           
                _service.Add(model, senderUserId);
                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }

            return StatusCode(code, response);
        }

        [HttpPut("")]
        public ActionResult<SuccessResponse> Update(FriendRequest model)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                int senderUserId = _authService.GetCurrentUserId();
                _service.Update(model, senderUserId);
                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }

            return StatusCode(code, response);
        }

        [HttpGet("paginate")]
        public ActionResult<ItemResponse<Paged<Friend>>> GetPage(int pageIndex, int pageSize)
        {
            int iCode = 200;
            BaseResponse response = null;

            try
            {
                Paged<Friend> paged = _service.GetPage(pageIndex, pageSize);

                if (paged == null)
                {
                    iCode = 404;
                    response = new ErrorResponse("No courses found in database.");
                }
                else
                {
                    response = new ItemResponse<Paged<Friend>> { Item = paged };
                }
            }
            catch (Exception ex)
            {
                iCode = 500;
                base.Logger.LogError(ex.ToString());
                response = new ErrorResponse($"Generic Error: {ex.Message}");
            }

            return StatusCode(iCode, response);
        }

    }
}
