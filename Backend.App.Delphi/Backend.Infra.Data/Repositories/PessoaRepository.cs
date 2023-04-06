using Backend.Domain.Entities;
using Backend.Infra.Data.Interfaces;
using Backend.Infra.Data.Context;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;

namespace Backend.Infra.Data.Repositories;

public class PessoaRepository : BaseRepository, IPessoaRepository
{

    public PessoaRepository(DatabaseContext context): base(context)
    {
    }

    public async Task<Pessoa> AdicionarAsync(Pessoa newPessoa)
    {
        return await base.AdicionarAsync<Pessoa>(newPessoa);
    }

    public Pessoa Alterar(Pessoa pessoa)
    {
        return base.Alterar(pessoa); 
    }

    public async Task<Pessoa> PesquisarAsync(Expression<Func<Pessoa, bool>> condicao)
    {
        return await base.PesquisarAsync<Pessoa>(condicao);
    }

    public void Remover(Pessoa dados)
    {
        base.Remover(dados);    
    }
    public async Task<ICollection<Pessoa>> PesquisarTodosAsync(Expression<Func<Pessoa, bool>> condicao)
    {
        return await base.PesquisarTodosAsync<Pessoa>(condicao);
    }



}
