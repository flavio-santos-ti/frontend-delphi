using Backend.Domain.Dtos.Pessoa;
using Backend.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Backend.Infra.Data.Interfaces;

public interface IPessoaRepository 
{
    Task<Pessoa> AdicionarAsync(Pessoa newPessoa);
    Pessoa Alterar(Pessoa pessoa);
    void Remover(Pessoa dados);
    Task<Pessoa> PesquisarAsync(Expression<Func<Pessoa, bool>> condicao);
    Task<ICollection<Pessoa>> PesquisarTodosAsync(Expression<Func<Pessoa, bool>> condicao);
}
