using Backend.Domain.Dtos.Pessoa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Business.Interfaces;

public interface IPessoaService
{
    Task<PessoaDto> AdicionarAsync(PessoaCreateDto dados);
    Task<PessoaDto> AlterarAsync(PessoaUpdateDto dados);
    Task<int> ExcluirAsync(long id);
    Task<ICollection<PessoaDto>> ListarTodasAsync();
}
