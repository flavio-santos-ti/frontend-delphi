using Backend.Domain.Entities;
using Backend.Domain.Entities.Base;
using Backend.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Linq.Expressions;
using System.Xml.Linq;

namespace Backend.Infra.Data.Repositories;

public class BaseRepository
{
    private readonly DatabaseContext _context;

    public BaseRepository(DatabaseContext context)
    {
        _context = context;
    }

    protected async Task<T> IncluirAsync<T>(DbContext ctx, dynamic dados) where T : class
    {
        var context = (DatabaseContext)ctx;

        await context.Set<T>().AddAsync(dados);
        
        await context.SaveChangesAsync();

        return dados;
    }

    protected async Task<T> AdicionarAsync<T>(T dados) where T : class
    {
        await _context.Set<T>().AddAsync(dados);
        return dados;
    }

    protected T Alterar<T>(T dados) where T : class
    {
        _context.Set<T>().Entry(dados).State = EntityState.Modified;
        return dados;
    }

    protected async Task<T> PesquisarAsync<T>(Expression<Func<T, bool>> condicao) where T : class
    {   
        return await _context.Set<T>().Where(condicao).FirstOrDefaultAsync();
    }

    protected void Remover<T>(T dados) where T : class
    {
        _context.Set<T>().Remove(dados);
    }

    protected async Task<ICollection<T>> PesquisarTodosAsync<T>(Expression<Func<T, bool>> condicao) where T : class
    {
        return await _context.Set<T>().Where(condicao).AsNoTracking().ToListAsync();
    }
}
