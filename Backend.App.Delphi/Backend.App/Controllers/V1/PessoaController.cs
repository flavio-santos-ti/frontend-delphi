using Backend.Domain.Dtos.Pessoa;
using Backend.Business.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Backend.App.Controllers.V1;

[ApiController]
[ApiVersion("1")]
[Route("api/v{version:apiVersion}/[controller]")]
public class PessoaController : ControllerBase
{
    private readonly IPessoaService _service;

    public PessoaController(IPessoaService service)
    {
        _service = service;
    }

    [HttpPost]
    public async Task<IActionResult> IncluirAsync(PessoaCreateDto dados)
    {
        var pessoa = await _service.AdicionarAsync(dados);

        return Ok(pessoa);
    }

    [HttpPut]
    public async Task<IActionResult> AlterarAsync(PessoaUpdateDto dados)
    {
        var pessoa = await _service.AlterarAsync(dados);

        return Ok(pessoa);
    }

    [HttpDelete("{id:long}")]
    public async Task<IActionResult> ExcluirAsync(int id)
    {
        var exclusao = await _service.ExcluirAsync(id);

        return Ok(exclusao); 
    }

    [HttpGet]
    public async Task<IActionResult> ListarAsync()
    {
        var pessoas = await _service.ListarTodasAsync();

        return Ok(pessoas);
    }

}
