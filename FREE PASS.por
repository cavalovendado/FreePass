programa {
  
  // Vetores das turmas separados por ano de ensino
  cadeia turmas1[4] = {"Luther","McLaren","Alan","Willian"}
  cadeia turmas2[4] = {"Nisia","Ayrton","Ana Néri","Van Gogh"}
  cadeia turmas3[4] = {"Gloria","Anitta","Mary","Leonardo"}

  // Vetores de cadastro de alunos nas turmas
  cadeia alunosLuther[30], alunosMcLaren[30], alunosAlan[30], alunosWillian[30]
  cadeia alunosNisia[30], alunosAyrton[30], alunosAna[30], alunosVangogh[30]
  cadeia alunosGloria[30], alunosAnitta[30], alunosMary[30], alunosLeonardo[30]

  // Vetor de liberações
  cadeia liberacoes[50], nomeSelecionado[50]

  // Contadores de cadastros em cada turma
  inteiro contTurmaLuther=0, contTurmaMcLaren=0, contTurmaAlan=0, contTurmaWillian=0
  inteiro contTurmaNisia=0, contTurmaAyrton=0, contTurmaAna=0, contTurmaVangogh=0
  inteiro contTurmaGloria=0, contTurmaAnitta=0, contTurmaMary=0, contTurmaLeonardo=0
  inteiro contLiberacoes=0

  // Variáveis gerais
  inteiro opcao, opcaoAnoEnsino, opcaoTurma
  cadeia informacao, continuar

  funcao inicio() {
    faca {
      limpa()
      escreva(" MENU DE LIBERAÇÃO DE ALUNOS \n\n")
      escreva("1 - Cadastrar alunos\n")
      escreva("2 - Listar alunos cadastrados\n")
      escreva("3 - Liberar aluno [pais]\n")
      escreva("4 - Verificar liberações [portaria]\n")
      escreva("0 - Sair\n\n")
      escreva("Digite o número da opção desejada: ")
      leia(opcao)

      escolha(opcao) {
        
        caso 1:
          informacao = "cadastrar"
          selecionarTurma(informacao)
          
          se(opcaoAnoEnsino == 1) {
            cadastrarAlunos1(opcaoTurma)
          } senao se(opcaoAnoEnsino == 2) {
            cadastrarAlunos2(opcaoTurma)
          } senao {
            cadastrarAlunos3(opcaoTurma)
          }

          escreva("\nDigite 'enter' para voltar ao menu: ")
          leia(continuar)
        pare

        caso 2:
          limpa()
          escreva("== LISTAR ==\n")
          escreva("Em qual ano deseja listar o aluno: \n")
          escreva("1 - 1º ano\n")
          escreva("2 - 2º ano\n")
          escreva("3 - 3º ano\n")
          leia(opcaoAnoEnsino)

          escolha(opcaoAnoEnsino) {
            caso 1:
              escreva("== Turmas 1º ano ==\n")
              para(inteiro i = 0; i < 4; i++) {
                escreva(i + 1, " - ", turmas1[i], "\n")
              }
              escreva("Digite o número da turma que deseja listar: ")
              leia(opcaoTurma)
              listarAlunos1(opcaoTurma)
              escreva("\nDigite 'enter' para voltar ao menu: ")
              leia(continuar)
            pare

            caso 2:
              escreva("== Turmas 2º ano ==\n")
              para(inteiro i = 0; i < 4; i++) {
                escreva(i + 1, " - ", turmas2[i], "\n")
              }
              escreva("Digite o número da turma que deseja listar: ")
              leia(opcaoTurma)
              listarAlunos2(opcaoTurma)
              escreva("\nDigite 'enter' para voltar ao menu: ")
              leia(continuar)
            pare

            caso 3:
              escreva("== Turmas 3º ano ==\n")
              para(inteiro i = 0; i < 4; i++) {
                escreva(i + 1, " - ", turmas3[i], "\n")
              }
              escreva("Digite o número da turma que deseja listar: ")
              leia(opcaoTurma)
              listarAlunos3(opcaoTurma)
              escreva("\nDigite 'enter' para voltar ao menu: ")
              leia(continuar)
            pare
          }
        pare

        caso 3:
          inteiro codigoAluno
          cadeia horario, dia
          caracter resposta
          limpa()
          escreva("== LIBERAÇÃO ==\n")
          informacao = "liberar"
          selecionarTurma(informacao)

          se(opcaoAnoEnsino == 1) {
            listarAlunos1(opcaoTurma)
          } senao se(opcaoAnoEnsino == 2) {
            listarAlunos2(opcaoTurma)
          } senao {
            listarAlunos3(opcaoTurma)
          }          

          escreva("Digite o horário de liberação: ")
          leia(horario)
          escreva("Digite o dia de liberação: ")
          leia(dia)
          limpa()
          escreva("Aluno: ", nomeSelecionado[contLiberacoes], "\nDia: ", dia, "\nHorário: ", horario)
          escreva("\n\nDeseja confirmar a liberação? [s/n]: ")
          leia(resposta)
          
          se(resposta == 's') {
            liberacoes[contLiberacoes] = "Aluno: " + nomeSelecionado[contLiberacoes] + " | Dia: " + dia + " | Horário: " + horario
            contLiberacoes++
            escreva("\nLiberação registrada com sucesso!\n")
          }
          leia(continuar)
        pare

        caso 4:
          liberacoesPortaria()
          
        pare
      }
    } enquanto(opcao != 0)
  }

  funcao liberacoesPortaria() {
    limpa()
    escreva("== LISTAR LIBERAÇÕES PORTARIA ==\n\n")
    se(contLiberacoes == 0) {
      escreva("Nenhuma liberação registrada.\n")
    } senao {
      para(inteiro i = 0; i < contLiberacoes; i++) {
        escreva(i+1, " - ", liberacoes[i], "\n")
      }
    }
    escreva("\nDigite 'enter' para voltar ao menu: ")
    leia(continuar)
  }

  funcao selecionarTurma(cadeia informacao) {
    limpa()
    escreva("Em qual ano deseja ", informacao, " o aluno:\n")
    escreva("1 - 1º ano\n")
    escreva("2 - 2º ano\n")
    escreva("3 - 3º ano\n")
    leia(opcaoAnoEnsino)

    escolha(opcaoAnoEnsino) {
      caso 1:
        limpa()
        escreva("== Turmas 1º ano ==\n")
        para(inteiro i = 0; i < 4; i++) {
          escreva(i + 1, " - ", turmas1[i], "\n")
        }
        escreva("Digite o número da turma que deseja ", informacao, ": ")
        leia(opcaoTurma)
      pare

      caso 2:
        limpa()
        escreva("== Turmas 2º ano ==\n")
        para(inteiro i = 0; i < 4; i++) {
          escreva(i + 1, " - ", turmas2[i], "\n")
        }
        escreva("Digite o número da turma que deseja ", informacao, ": ")
        leia(opcaoTurma)
      pare

      caso 3:
        limpa()
        escreva("== Turmas 3º ano ==\n")
        para(inteiro i = 0; i < 4; i++) {
          escreva(i + 1, " - ", turmas3[i], "\n")
        }
        escreva("Digite o número da turma que deseja ", informacao, ": ")
        leia(opcaoTurma)
      pare
    }
  }

  // ===== FUNÇÕES DE LISTAGEM =====

  funcao listarAlunos1(inteiro opcaoTurma) {
    escolha(opcaoTurma) {
      caso 1:
        inteiro indiceAluno
        limpa()
        para(inteiro i = 0; i < contTurmaLuther; i++) {
          escreva(i+1, " - ", alunosLuther[i], "\n")
        }

        escreva("Digite o numero do aluno: ")
        leia(indiceAluno)
        nomeSelecionado[contLiberacoes] = alunosLuther[indiceAluno - 1]
      pare

      caso 2:
       inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaMcLaren; i++) {
          escreva(i+1, " - ", alunosMcLaren[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosMcLaren[indiceAluno - 1]
      pare
      pare

      caso 3:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaAlan; i++) {
          escreva(i+1, " - ", alunosAlan[i], "\n")
        }

        
         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosAlan[indiceAluno - 1]
      pare

      caso 4:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaWillian; i++) {
          escreva(i+1, " - ", alunosWillian[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosWillian[indiceAluno - 1]
      pare
    }
  }

  funcao listarAlunos2(inteiro opcaoTurma) {
    escolha(opcaoTurma) {
      caso 1:
        inteiro indiceAluno
        limpa()
        para(inteiro i = 0; i < contTurmaNisia; i++) {
          escreva(i+1, " - ", alunosNisia[i], "\n")
        }

        escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosNisia[indiceAluno - 1]
      pare

      caso 2:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaAyrton; i++) {
          escreva(i+1, " - ", alunosAyrton[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosAyrton[indiceAluno - 1]
      pare

      caso 3:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaAna; i++) {
          escreva(i+1, " - ", alunosAna[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosAna[indiceAluno - 1]
      pare

      caso 4:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaVangogh; i++) {
          escreva(i+1, " - ", alunosVangogh[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosVangogh[indiceAluno - 1]
      pare
    }
  }

  funcao listarAlunos3(inteiro opcaoTurma) {
    escolha(opcaoTurma) {
      caso 1:
        inteiro indiceAluno
        limpa()
        para(inteiro i = 0; i < contTurmaGloria; i++) {
          escreva(i+1, " - ", alunosGloria[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosGloria[indiceAluno - 1]
      pare

      caso 2:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaAnitta; i++) {
          escreva(i+1, " - ", alunosAnitta[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosAnitta[indiceAluno - 1]
      pare

      caso 3:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaMary; i++) {
          escreva(i+1, " - ", alunosMary[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosMary[indiceAluno - 1]
      pare

      caso 4:
        inteiro indiceAluno
        para(inteiro i = 0; i < contTurmaLeonardo; i++) {
          escreva(i+1, " - ", alunosLeonardo[i], "\n")
        }

         escreva("Digite o numero do aluno: ")
         leia(indiceAluno)
         nomeSelecionado[contLiberacoes] = alunosLeonardo[indiceAluno - 1]
      pare
    }
  }

  // ===== FUNÇÕES DE CADASTRO =====

  funcao cadastrarAlunos1(inteiro opcaoTurma) {
    escolha(opcaoTurma) {
      caso 1:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosLuther[contTurmaLuther])
        contTurmaLuther++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 2:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosMcLaren[contTurmaMcLaren])
        contTurmaMcLaren++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 3:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosAlan[contTurmaAlan])
        contTurmaAlan++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 4:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosWillian[contTurmaWillian])
        contTurmaWillian++
        escreva("Aluno cadastrado com sucesso!\n")
      pare
    }
  }

  funcao cadastrarAlunos2(inteiro opcaoTurma) {
    escolha(opcaoTurma) {
      caso 1:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosNisia[contTurmaNisia])
        contTurmaNisia++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 2:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosAyrton[contTurmaAyrton])
        contTurmaAyrton++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 3:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosAna[contTurmaAna])
        contTurmaAna++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 4:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosVangogh[contTurmaVangogh])
        contTurmaVangogh++
        escreva("Aluno cadastrado com sucesso!\n")
      pare
    }
  }

  funcao cadastrarAlunos3(inteiro opcaoTurma) {
    escolha(opcaoTurma) {
      caso 1:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosGloria[contTurmaGloria])
        contTurmaGloria++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 2:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosAnitta[contTurmaAnitta])
        contTurmaAnitta++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 3:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosMary[contTurmaMary])
        contTurmaMary++
        escreva("Aluno cadastrado com sucesso!\n")
      pare

      caso 4:
        limpa()
        escreva("Digite o nome do aluno: ")
        leia(alunosLeonardo[contTurmaLeonardo])
        contTurmaLeonardo++
        escreva("Aluno cadastrado com sucesso!\n")
      pare
    }
  }
}

