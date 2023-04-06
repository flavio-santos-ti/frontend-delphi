using Backend.Domain.Dtos.Pessoa;
using Backend.Infra.Data.Interfaces;
using Backend.Business.Interfaces;
using Backend.Infra.Data.UnitOfWork;
using AutoMapper;
using Backend.Domain.Entities;

namespace Backend.Business.Services;

public class PessoaService : IPessoaService
{
    private readonly IPessoaRepository _pessoaRepository;
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public PessoaService(IPessoaRepository pessoaRepository, IUnitOfWork unitOfWork, IMapper mapper)
    {
        _pessoaRepository = pessoaRepository;
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<PessoaDto> AdicionarAsync(PessoaCreateDto dados)
    {
        var pessoaNew = _mapper.Map<Pessoa>(dados);

        pessoaNew.DataInclusao = DateTime.Now;
        pessoaNew.DataAlteracao = DateTime.Now;

        var pessoa = await _pessoaRepository.AdicionarAsync(pessoaNew);

        await _unitOfWork.CommitAsync();

        var pessoaDto = _mapper.Map<PessoaDto>(pessoa);

        return pessoaDto;
    }

    public async Task<PessoaDto> AlterarAsync(PessoaUpdateDto dados)
    {
        var pessoa = await _pessoaRepository.PesquisarAsync(b => b.Id == dados.Id);

        pessoa.Nome = dados.Nome;
        pessoa.Sobrenome = dados.Sobrenome;
        pessoa.Cep = dados.Cep;
        pessoa.Logradouro = dados.Logradouro;
        pessoa.Numero = dados.Numero;
        pessoa.Complemento = dados.Complemento;
        pessoa.Bairro = dados.Bairro;
        pessoa.Municipio = dados.Municipio;
        pessoa.UF = dados.UF;
        pessoa.DataAlteracao = DateTime.Now;

        var pessoaUpdated = _pessoaRepository.Alterar(pessoa);

        await _unitOfWork.CommitAsync();

        var pessoaDto = _mapper.Map<PessoaDto>(pessoaUpdated);

        return pessoaDto;
    }

    public async Task<int> ExcluirAsync(long id)
    {
        var pessoa = await _pessoaRepository.PesquisarAsync(b => b.Id == id);

        _pessoaRepository.Remover(pessoa);

        return await _unitOfWork.CommitAsync();
    }

    public async Task<ICollection<PessoaDto>> ListarTodasAsync()
    {
        var pessoas = await _pessoaRepository.PesquisarTodosAsync(b => 1 == 1);

        var pessoasDto = _mapper.Map<ICollection<PessoaDto>>(pessoas);

        return pessoasDto;
    }
}
