SELECT * FROM
(
    SELECT 
        prontuario_cidadao.no_cidadao,
        prontuario_cidadao.no_social,
        status.no_status_atend,
        TO_CHAR(atendimento.dt_ultima_alteracao_status,'HH24:MI:SS') AS hour_init,
        tipo_atendimento.no_tipo_atend_prof
    FROM
    (
        SELECT *
        FROM public.tb_atend atendimento
        LEFT JOIN public.tb_ator_papel t1
            ON atendimento.co_responsavel = t1.co_seq_ator_papel
        LEFT JOIN public.tb_prof t2
            ON t1.co_prof = t2.co_seq_prof
        AND atendimento.dt_inicio::date = CURRENT_DATE
        AND atendimento.st_atend IN (2, 3, 7)
    ) atendimento
    LEFT JOIN
    (
        SELECT
            profissional.co_seq_atend_prof,
            profissional.dt_inicio,
            profissional.co_lotacao,
            profissional.tp_atend_prof,
            lotacao.co_ator_papel,
            lotacao.co_prof,
            nome.co_seq_prof,
            nome.no_profissional
        FROM public.tb_atend_prof profissional
        LEFT JOIN public.tb_lotacao lotacao
            ON profissional.co_lotacao = lotacao.co_ator_papel
        LEFT JOIN public.tb_prof nome
            ON lotacao.co_prof = nome.co_seq_prof
    ) profissional
    ON atendimento.co_atend_prof = profissional.co_seq_atend_prof
    LEFT JOIN public.tb_tipo_atend_prof tipo_atendimento
        ON profissional.tp_atend_prof = tipo_atendimento.co_tipo_atend_prof
    LEFT JOIN public.tb_status_atend status
        ON atendimento.st_atend = status.co_status_atend
    LEFT JOIN
    (
        SELECT
            prontuario.co_seq_prontuario,
            cidadao.no_cidadao,
            cidadao.no_social,
            cidadao.nu_cpf,
            cidadao.nu_cns
        FROM public.tb_prontuario prontuario
        LEFT JOIN public.tb_cidadao cidadao
            ON prontuario.co_cidadao = cidadao.co_seq_cidadao
    ) prontuario_cidadao
    ON atendimento.co_prontuario = prontuario_cidadao.co_seq_prontuario
    LEFT JOIN public.tb_classificacao_risco risco
        ON atendimento.co_classificacao_risco = risco.co_classificacao_risco
    INNER JOIN
    (
        SELECT
            unidade.co_seq_unidade_saude,
            unidade.no_unidade_saude
        FROM public.tb_unidade_saude unidade
        INNER JOIN public.tb_localidade localidade
            ON unidade.co_localidade_endereco = localidade.co_localidade
    ) local_unidade
    ON atendimento.co_unidade_saude = local_unidade.co_seq_unidade_saude
    WHERE status.no_status_atend != 'NÃO AGUARDOU ATENDIMENTO'
    AND tipo_atendimento.no_tipo_atend_prof IS NOT NULL
    ORDER BY atendimento.dt_ultima_alteracao_status DESC
) AS subquery_alias
LIMIT 2;