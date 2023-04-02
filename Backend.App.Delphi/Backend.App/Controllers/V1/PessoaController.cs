using Microsoft.AspNetCore.Mvc;

namespace Backend.App.Controllers.V1;

[ApiController]
[ApiVersion("1")]
[Route("api/v{version:apiVersion}/[controller]")]
public class PessoaController : ControllerBase
{
    public PessoaController()
    {
    }
}
