//+------------------------------------------------------------------+
//|                                                   Construtor.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Controls\Dialog.mqh>
#include <Controls\Panel.mqh>
#include <Controls\Button.mqh>
#include <Controls\Label.mqh>
#include <Controls\Edit.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\RadioGroup.mqh>

#define TAB_COUNT 11

enum ENUM_CONSTRUTOR_MERCADO
  {
   CONSTRUTOR_B3 = 0,
   CONSTRUTOR_FOREX = 1
  };

enum ENUM_CONSTRUTOR_TIPO_OPERACIONAL
  {
   CONSTRUTOR_DAY_TRADE = 0,
   CONSTRUTOR_SWING_TRADE = 1
  };

enum ENUM_CONSTRUTOR_PROCESSAMENTO
  {
   CONSTRUTOR_CADA_TICK = 0,
   CONSTRUTOR_CADA_SEGUNDO = 1
  };

enum ENUM_TEMPO_GRAFICO
  {
   CORRENTE = 0,
   M1 = 1,
   M2 = 2,
   M3 = 3,
   M4 = 4,
   M5 = 5,
   M6 = 6,
   M10 = 7,
   M12 = 8,
   M15 = 9,
   M30 = 10,
   H1 = 11,
   H2 = 12,
   H3 = 13,
   H4 = 14,
   H6 = 15,
   H8 = 16,
   H12 = 17,
   D1 = 18,
   W1 = 19,
   MN1 = 20
  };

enum ENUM_TIPO_CALCULO_DISTANCIAS
  {
   PERCENTUAL = 0,
   EM_PONTOS = 1
  };

enum ENUM_BASE_REFERENCIA_CALCULO
  {
   REFERENCIA_MAXIMA = 0,
   REFERENCIA_MINIMA = 1,
   REFERENCIA_ABERTURA = 2,
   REFERENCIA_FECHAMENTO = 3
  };

enum ENUM_BASE_REFERENCIA_MULTIPLICAR
  {
   MULTIPLICAR_CORPO = 0,
   MULTIPLICAR_PAVIOS = 1
  };

enum ENUM_CANDLE_REFERENCIA
  {
   CANDLE_ATUAL = 0,
   CANDLE_ULTIMO = 1,
   CANDLE_PENULTIMO = 2,
   CANDLE_ANTEPENULTIMO = 3,
   CANDLE_ANTEANTEPENULTIMO = 4,
   CANDLE_ANTEANTEANTEPENULTIMO = 5
  };

input group "1. Inf. Iniciais";
input string                        InpNomeEstrategia       = "Minha estrategia";
input ENUM_CONSTRUTOR_MERCADO       InpMercado              = CONSTRUTOR_B3;
input ENUM_CONSTRUTOR_TIPO_OPERACIONAL InpTipoOperacional    = CONSTRUTOR_DAY_TRADE;
input ENUM_CONSTRUTOR_PROCESSAMENTO InpModoProcessamento    = CONSTRUTOR_CADA_TICK;
input bool                          InpOperarCompra         = true;
input bool                          InpOperarVenda          = true;

input group "2. Horario";
input int                           InpHorarioInicialHora   = 9;
input int                           InpHorarioInicialMin    = 0;
input int                           InpHorarioFinalHora     = 17;
input int                           InpHorarioFinalMin      = 0;
input bool                          InpDesejaZerarPorHorario= true;
input int                           InpHorarioZerarHora     = 23;
input int                           InpHorarioZerarMin      = 0;

input group "3. Configuracao inicial";
input ENUM_TEMPO_GRAFICO             InpTempoGrafico         = CORRENTE;
input double                         InpVolumeInicial        = 1.0;
input int                            InpSpreadMaximo         = 0;

input group "4. Stop loss";
input bool                           InpUsarStoploss                 = true;
input ENUM_TIPO_CALCULO_DISTANCIAS   InpTipoCalculoStoploss          = EM_PONTOS;
input bool                           InpStoplossFixo                 = true;
input bool                           InpStoplossCalculoMedia         = false;
input bool                           InpStoplossCalculoMultiplicar   = false;
input bool                           InpStoplossReferencia           = false;
input int                            InpStoplossCalculoQtdCandle     = 3;
input ENUM_BASE_REFERENCIA_CALCULO   InpStoplossCalculoBaseReferencia= REFERENCIA_MAXIMA;
input ENUM_BASE_REFERENCIA_MULTIPLICAR InpStoplossCalculoBaseMultiplicar = MULTIPLICAR_CORPO;
input int                            InpStoplossCalculoMultiplicarCandle = 3;
input double                         InpStoplossCalculoMultiplicarMult = 1.0;
input ENUM_BASE_REFERENCIA_CALCULO   InpStoplossReferenciaBase       = REFERENCIA_MAXIMA;
input ENUM_CANDLE_REFERENCIA         InpStoplossReferenciaCandle     = CANDLE_ATUAL;
input double                         InpStoplossDistancia            = 0.0;

color COLOR_SIDEBAR_BG      = C'24,34,52';
color COLOR_SIDEBAR_BORDER  = C'48,66,92';
color COLOR_CONTENT_BG      = C'244,239,230';
color COLOR_CONTENT_BORDER  = C'215,205,187';
color COLOR_ACCENT          = C'220,108,64';
color COLOR_TAB_BG          = C'32,47,69';
color COLOR_TAB_BORDER      = C'64,87,118';
color COLOR_TAB_TEXT        = C'229,235,241';
color COLOR_TEXT_DARK       = C'42,38,32';
color COLOR_TEXT_MUTED      = C'107,101,89';
color COLOR_SECTION_BG      = C'250,245,236';
color COLOR_SECTION_BORDER  = C'219,206,186';
color COLOR_SUCCESS         = C'56,125,90';
color COLOR_ERROR           = C'178,64,52';

string g_tab_names[TAB_COUNT] =
  {
   "1. Inf. Iniciais",
   "2. Horario",
   "3. Conf. inicial",
   "4. Stop loss",
   "5. Stop movel",
   "6. Take profit",
   "7. Trailing stop",
   "8. Saidas parciais",
   "9. Sinais",
   "10. Ajustes finais",
   "11. Painel"
  };

string g_tab_roles[TAB_COUNT] =
  {
   "Informacoes basicas do projeto",
   "Janela operacional",
   "Parametros de partida",
   "Protecao inicial",
   "Ajuste dinamico do stop",
   "Objetivo de ganho",
   "Travamento progressivo",
   "Escalonamento de saidas",
   "Motor de sinais",
   "Revisao e acabamento",
   "Painel geral"
  };

string g_tab_summaries[TAB_COUNT] =
  {
   "Define nome, mercado, tipo operacional e processamento inicial do robo.",
   "Organiza periodos, sessoes e limites de horario para operar.",
   "Define timeframe, volume inicial e spread maximo da partida.",
   "Liga ou desliga o stop loss inicial e define a base de calculo.",
   "Reserva o bloco de ajuste do stop conforme o mercado anda.",
   "Centraliza as metas de ganho e as condicoes de alvo.",
   "Cuida do trailing para proteger lucro de forma progressiva.",
   "Permite dividir a saida em etapas e niveis planejados.",
   "Agrupa os gatilhos tecnicos que vao gerar entradas e saidas.",
   "Fecha a construcao com conferencias e ultimos refinamentos.",
   "Espaco reservado para o painel geral do construtor."
  };

string g_tab_notes[TAB_COUNT] =
  {
   "- Esta aba ja alimenta a configuracao ativa do EA.",
   "- Esta aba define a janela operacional e a zeragem por horario.",
   "- Baseia a partida na configuracao inicial do EaMin.",
   "- Sim mantem o stop loss inicial e o gerenciamento por break-even/trailing.",
   "- Espaco reservado para break-even e stop movel.",
   "- Espaco reservado para metas e alvos de ganho.",
   "- Espaco reservado para trailing stop.",
   "- Espaco reservado para saidas parciais.",
   "- Espaco reservado para indicadores, filtros e sinais.",
   "- Espaco reservado para ajustes finais e revisao.",
   "- Alterna a janela entre modo completo e modo compacto."
  };

struct SConfiguracaoPainel
  {
   string                         nome_estrategia;
   ENUM_CONSTRUTOR_MERCADO        mercado;
   ENUM_CONSTRUTOR_TIPO_OPERACIONAL tipo_operacional;
   ENUM_CONSTRUTOR_PROCESSAMENTO  modo_processamento;
   bool                           operar_compra;
   bool                           operar_venda;
   int                            horario_inicial_hora;
   int                            horario_inicial_min;
   int                            horario_final_hora;
   int                            horario_final_min;
   bool                           zerar_por_horario;
   int                            horario_zerar_hora;
   int                            horario_zerar_min;
   ENUM_TEMPO_GRAFICO             tempo_grafico;
   ENUM_TIPO_CALCULO_DISTANCIAS   tipo_calculo_stoploss;
   bool                           stoploss_fixo;
   bool                           stoploss_calculo_media;
   bool                           stoploss_calculo_multiplicar;
   bool                           stoploss_referencia;
   int                            stoploss_calculo_qtd_candle;
   int                            stoploss_calculo_base_referencia;
   int                            stoploss_calculo_base_multiplicar;
   int                            stoploss_calculo_multiplicar_candle;
   double                         stoploss_calculo_multiplicar_mult;
   int                            stoploss_referencia_base;
   int                            stoploss_referencia_candle;
   double                         stoploss_distancia;
   double                         volume_inicial;
   int                            spread_maximo;
   bool                           usar_stop_loss;
  };

SConfiguracaoPainel g_config;
bool                g_execucao_habilitada = false;
bool                g_bloquear_sincronizacao = false;

string TextoLimpo(const string valor)
  {
   string resultado = valor;

   while(StringLen(resultado) > 0 && StringGetCharacter(resultado,0) <= 32)
      resultado = StringSubstr(resultado,1);

   while(StringLen(resultado) > 0 && StringGetCharacter(resultado,StringLen(resultado) - 1) <= 32)
      resultado = StringSubstr(resultado,0,StringLen(resultado) - 1);

   return(resultado);
  }

int LimitarInteiro(const int valor,const int minimo,const int maximo)
  {
   return(MathMax(minimo,MathMin(maximo,valor)));
  }

void CarregarConfiguracaoDosInputs()
  {
   g_config.nome_estrategia    = TextoLimpo(InpNomeEstrategia);
   g_config.mercado            = InpMercado;
   g_config.tipo_operacional   = InpTipoOperacional;
   g_config.modo_processamento = InpModoProcessamento;
   g_config.operar_compra      = InpOperarCompra;
   g_config.operar_venda       = InpOperarVenda;
   g_config.horario_inicial_hora = LimitarInteiro(InpHorarioInicialHora,0,23);
   g_config.horario_inicial_min  = LimitarInteiro(InpHorarioInicialMin,0,59);
   g_config.horario_final_hora   = LimitarInteiro(InpHorarioFinalHora,0,23);
   g_config.horario_final_min    = LimitarInteiro(InpHorarioFinalMin,0,59);
   g_config.zerar_por_horario    = InpDesejaZerarPorHorario;
   g_config.horario_zerar_hora   = LimitarInteiro(InpHorarioZerarHora,0,23);
   g_config.horario_zerar_min    = LimitarInteiro(InpHorarioZerarMin,0,59);
   g_config.tempo_grafico        = InpTempoGrafico;
   g_config.stoploss_fixo        = InpStoplossFixo;
   g_config.stoploss_calculo_media = InpStoplossCalculoMedia;
   g_config.stoploss_calculo_multiplicar = InpStoplossCalculoMultiplicar;
   g_config.stoploss_referencia  = InpStoplossReferencia;
   g_config.stoploss_calculo_qtd_candle = LimitarInteiro(InpStoplossCalculoQtdCandle,1,999);
   g_config.stoploss_calculo_base_referencia = (int)LimitarInteiro((int)InpStoplossCalculoBaseReferencia,0,3);
   g_config.stoploss_calculo_base_multiplicar = (int)LimitarInteiro((int)InpStoplossCalculoBaseMultiplicar,0,1);
   g_config.stoploss_calculo_multiplicar_candle = LimitarInteiro(InpStoplossCalculoMultiplicarCandle,1,999);
   g_config.stoploss_calculo_multiplicar_mult = InpStoplossCalculoMultiplicarMult;
   g_config.stoploss_referencia_base = (int)LimitarInteiro((int)InpStoplossReferenciaBase,0,3);
   g_config.stoploss_referencia_candle = (int)LimitarInteiro((int)InpStoplossReferenciaCandle,0,5);
   g_config.stoploss_distancia   = InpStoplossDistancia;
   g_config.volume_inicial       = InpVolumeInicial;
   g_config.spread_maximo        = MathMax(0,InpSpreadMaximo);
   g_config.usar_stop_loss       = InpUsarStoploss;
   g_config.tipo_calculo_stoploss = InpTipoCalculoStoploss;
   g_execucao_habilitada       = false;
  }

bool ValidarConfiguracao(string &mensagem)
  {
   if(TextoLimpo(g_config.nome_estrategia) == "")
     {
      mensagem = "Informe o nome da estrategia antes de executar.";
      return(false);
     }

   if(!g_config.operar_compra && !g_config.operar_venda)
     {
      mensagem = "Ative compra, venda ou ambos para liberar a execucao.";
      return(false);
     }

   if(g_config.volume_inicial <= 0.0)
     {
      mensagem = "Informe um volume inicial maior que zero.";
      return(false);
     }

   if(g_config.spread_maximo < 0)
     {
      mensagem = "Informe um spread maximo valido.";
      return(false);
     }

   if(g_config.usar_stop_loss)
     {
      const int modos_selecionados =
         (g_config.stoploss_fixo ? 1 : 0) +
         (g_config.stoploss_calculo_media ? 1 : 0) +
         (g_config.stoploss_calculo_multiplicar ? 1 : 0) +
         (g_config.stoploss_referencia ? 1 : 0);

      if(modos_selecionados != 1)
        {
         mensagem = "Selecione exatamente um modo de stop loss: Fixo, Media, Multiplicar ou Referencia de preco.";
         return(false);
        }

      if(g_config.stoploss_calculo_media && g_config.stoploss_calculo_qtd_candle <= 0)
        {
         mensagem = "Informe uma quantidade de candles maior que zero para o modo Media.";
         return(false);
        }

      if(g_config.stoploss_calculo_multiplicar && (g_config.stoploss_calculo_multiplicar_candle <= 0 || g_config.stoploss_calculo_multiplicar_mult <= 0.0))
        {
         mensagem = "Informe Candle maior que zero e Mult maior que zero para o modo Multiplicar.";
         return(false);
        }
     }

   mensagem = "Configuracao valida.";
   return(true);
  }

class CConstrutorDialog : public CAppDialog
  {
private:
   CPanel            m_sidebar;
   CPanel            m_sidebar_ribbon;
   CPanel            m_content;
   CPanel            m_content_strip;
   CPanel            m_divider;
   CPanel            m_section_principal;
   CPanel            m_section_direcao;
   CPanel            m_section_horario_janela;
   CPanel            m_section_horario_zerar;
   CPanel            m_section_config_inicial;
   CPanel            m_section_stoploss;
   CPanel            m_card_mercado;
   CPanel            m_card_modo;
   CPanel            m_card_compra;
   CPanel            m_card_venda;
   CPanel            m_card_zerar;
   CPanel            m_card_stoploss;

   CLabel            m_brand_title;
   CLabel            m_content_tag;
   CLabel            m_content_title;
   CLabel            m_content_summary;
   CLabel            m_content_line_1;
   CLabel            m_content_line_2;
   CLabel            m_content_line_3;

   CButton           m_tab_1;
   CButton           m_tab_2;
   CButton           m_tab_3;
   CButton           m_tab_4;
   CButton           m_tab_5;
   CButton           m_tab_6;
   CButton           m_tab_7;
   CButton           m_tab_8;
   CButton           m_tab_9;
   CButton           m_tab_10;
   CButton           m_tab_11;

   CLabel            m_section_principal_title;
   CLabel            m_section_principal_note;
   CLabel            m_label_nome;
   CLabel            m_label_mercado;
   CLabel            m_label_operacional;
   CLabel            m_label_modo;

   CEdit             m_edit_nome;
   CComboBox         m_combo_mercado;
   CComboBox         m_combo_operacional;
   CComboBox         m_combo_modo;

   CLabel            m_section_direcao_title;
   CLabel            m_section_direcao_note;
   CLabel            m_label_compra;
   CLabel            m_label_venda;
   CRadioGroup       m_radio_compra;
   CRadioGroup       m_radio_venda;

   CLabel            m_section_horario_janela_title;
   CLabel            m_section_horario_janela_note;
   CLabel            m_label_horario_inicial_hora;
   CLabel            m_label_horario_inicial_min;
   CLabel            m_label_horario_final_hora;
   CLabel            m_label_horario_final_min;
   CComboBox         m_combo_horario_inicial_hora;
   CComboBox         m_combo_horario_inicial_min;
   CComboBox         m_combo_horario_final_hora;
   CComboBox         m_combo_horario_final_min;

   CLabel            m_section_horario_zerar_title;
   CLabel            m_section_horario_zerar_note;
   CLabel            m_label_zerar_por_horario;
   CRadioGroup       m_radio_zerar_por_horario;
   CLabel            m_label_horario_zerar_hora;
   CLabel            m_label_horario_zerar_min;
   CComboBox         m_combo_horario_zerar_hora;
   CComboBox         m_combo_horario_zerar_min;

   CLabel            m_section_config_inicial_title;
   CLabel            m_section_config_inicial_note;
   CLabel            m_label_tempo_grafico;
   CLabel            m_label_volume_inicial;
   CLabel            m_label_spread_maximo;
   CComboBox         m_combo_tempo_grafico;
   CEdit             m_edit_volume_inicial;
   CEdit             m_edit_spread_maximo;

   CLabel            m_section_stoploss_title;
   CLabel            m_section_stoploss_note;
   CPanel            m_card_stoploss_fixo;
   CPanel            m_card_stoploss_calculo;
   CPanel            m_card_stoploss_calculo_media;
   CPanel            m_card_stoploss_calculo_multiplicar;
   CPanel            m_card_stoploss_referencia;
   CLabel            m_label_stoploss_fixo;
   CLabel            m_label_stoploss_calculo;
   CLabel            m_label_stoploss_calculo_media;
   CLabel            m_label_stoploss_calculo_multiplicar;
   CLabel            m_label_stoploss_referencia;
   CRadioGroup       m_radio_stoploss_mode;
   CLabel            m_label_stoploss_referencia_base;
   CComboBox         m_combo_stoploss_referencia_base;
   CLabel            m_label_stoploss_referencia_candle;
   CComboBox         m_combo_stoploss_referencia_candle;
   CLabel            m_label_stoploss_calculo_qtd_candle;
   CEdit             m_edit_stoploss_calculo_qtd_candle;
   CLabel            m_label_stoploss_calculo_base_referencia;
   CComboBox         m_combo_stoploss_calculo_base_referencia;
   CLabel            m_label_stoploss_calculo_base_multiplicar;
   CComboBox         m_combo_stoploss_calculo_base_multiplicar;
   CLabel            m_label_stoploss_calculo_multiplicar_candle;
   CEdit             m_edit_stoploss_calculo_multiplicar_candle;
   CLabel            m_label_stoploss_calculo_multiplicar_mult;
   CEdit             m_edit_stoploss_calculo_multiplicar_mult;
   CLabel            m_label_stoploss_distancia;
   CEdit             m_edit_stoploss_distancia;
   CLabel            m_label_usar_stoploss;
   CRadioGroup       m_radio_stoploss_use;
   CLabel            m_label_tipo_stoploss;
   CComboBox         m_combo_tipo_stoploss;

   CLabel            m_status_label;
   CButton           m_button_execute;

   int               m_active_tab;
   bool              m_painel_compacto;
   CRect             m_rect_original;

public:
                     CConstrutorDialog(void);
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);

protected:
   bool              CreateSidebar(void);
   bool              CreateContent(void);
   bool              CreatePanelBlock(CPanel &panel,const string name,const int x1,const int y1,const int x2,const int y2,const color background,const color border);
   bool              CreateRadioCard(CPanel &panel,const string name,const int x1,const int y1,const int x2,const int y2);
   bool              CreateText(CLabel &label,const string name,const int x,const int y,const string text,const color text_color,const int font_size,const string font_name="Segoe UI");
   bool              CreateTabButton(CButton &button,const string name,const string text,const int x1,const int y1,const int x2,const int y2);
   bool              CreateTab1Form(void);
   bool              CreateTab2Form(void);
   bool              CreateTab3Form(void);
   bool              CreateTab4Form(void);
   bool              CreateStatusArea(void);
   bool              PopularComboIntervalo(CComboBox &combo,const int inicio,const int fim);
   bool              PopularComboTempoGrafico(CComboBox &combo);
   bool              PopularComboTipoCalculoDistancias(CComboBox &combo);
   bool              PopularComboBaseReferenciaCalculo(CComboBox &combo);
   bool              PopularComboBaseReferenciaMultiplicar(CComboBox &combo);
   bool              PopularComboCandleReferencia(CComboBox &combo);
   string            FormatarDecimalCurto(const double valor);
   CButton          *TabButtonByIndex(const int index);
   void              StyleTabButton(CButton &button,const bool active);
   void              SelectTab(const int index);
   void              AplicarModoPainel(const bool compacto);
   void              SetTab1ControlsVisible(const bool visible);
   void              SetTab2ControlsVisible(const bool visible);
   void              SetTab3ControlsVisible(const bool visible);
   void              SetTab4ControlsVisible(const bool visible);
   void              SetControlVisible(CWnd &control,const bool visible);
   void              SetControlEnabled(CWnd &control,const bool enabled);
   void              SyncRadioGroup(CRadioGroup &group,const long value);
   void              AtualizarControlesComConfig(void);
   void              AtualizarConfigComControles(const bool marcar_reexecucao);
   void              AtualizarEstadoZeragemHorario(void);
   void              AtualizarEstadoStoploss(void);
   void              AtualizarStatus(const string texto,const color texto_cor);
   void              AtualizarBotaoExecucao(void);
   void              OnClickTab1(void);
   void              OnClickTab2(void);
   void              OnClickTab3(void);
   void              OnClickTab4(void);
   void              OnClickTab5(void);
   void              OnClickTab6(void);
   void              OnClickTab7(void);
   void              OnClickTab8(void);
   void              OnClickTab9(void);
   void              OnClickTab10(void);
   void              OnClickTab11(void);
   void              OnEndEditNome(void);
   void              OnChangeMercado(void);
   void              OnChangeTipoOperacional(void);
   void              OnChangeModo(void);
   void              OnChangeCompra(void);
   void              OnChangeVenda(void);
   void              OnChangeHorarioInicialHora(void);
   void              OnChangeHorarioInicialMin(void);
   void              OnChangeHorarioFinalHora(void);
   void              OnChangeHorarioFinalMin(void);
   void              OnChangeZerarPorHorario(void);
   void              OnChangeHorarioZerarHora(void);
   void              OnChangeHorarioZerarMin(void);
   void              OnChangeTempoGrafico(void);
   void              OnEndEditVolumeInicial(void);
   void              OnEndEditSpreadMaximo(void);
   void              OnEndEditStoplossCalculoQtdCandle(void);
   void              OnEndEditStoplossCalculoMultiplicarCandle(void);
   void              OnEndEditStoplossCalculoMultiplicarMult(void);
   void              OnChangeStoplossUse(void);
   void              OnChangeStoplossMode(void);
   void              OnChangeStoplossCalculoBaseReferencia(void);
   void              OnChangeStoplossReferenciaBase(void);
   void              OnChangeStoplossReferenciaCandle(void);
   void              OnChangeTipoStoploss(void);
   virtual void      OnClickButtonClose(void);
   void              OnClickExecutar(void);
  };

EVENT_MAP_BEGIN(CConstrutorDialog)
   ON_EVENT(ON_CLICK,m_tab_1,OnClickTab1)
   ON_EVENT(ON_CLICK,m_tab_2,OnClickTab2)
   ON_EVENT(ON_CLICK,m_tab_3,OnClickTab3)
   ON_EVENT(ON_CLICK,m_tab_4,OnClickTab4)
   ON_EVENT(ON_CLICK,m_tab_5,OnClickTab5)
   ON_EVENT(ON_CLICK,m_tab_6,OnClickTab6)
   ON_EVENT(ON_CLICK,m_tab_7,OnClickTab7)
   ON_EVENT(ON_CLICK,m_tab_8,OnClickTab8)
   ON_EVENT(ON_CLICK,m_tab_9,OnClickTab9)
   ON_EVENT(ON_CLICK,m_tab_10,OnClickTab10)
   ON_EVENT(ON_CLICK,m_tab_11,OnClickTab11)
   ON_EVENT(ON_END_EDIT,m_edit_nome,OnEndEditNome)
   ON_EVENT(ON_CHANGE,m_combo_mercado,OnChangeMercado)
   ON_EVENT(ON_CHANGE,m_combo_operacional,OnChangeTipoOperacional)
   ON_EVENT(ON_CHANGE,m_combo_modo,OnChangeModo)
   ON_EVENT(ON_CHANGE,m_radio_compra,OnChangeCompra)
   ON_EVENT(ON_CHANGE,m_radio_venda,OnChangeVenda)
   ON_EVENT(ON_CHANGE,m_combo_horario_inicial_hora,OnChangeHorarioInicialHora)
   ON_EVENT(ON_CHANGE,m_combo_horario_inicial_min,OnChangeHorarioInicialMin)
   ON_EVENT(ON_CHANGE,m_combo_horario_final_hora,OnChangeHorarioFinalHora)
   ON_EVENT(ON_CHANGE,m_combo_horario_final_min,OnChangeHorarioFinalMin)
   ON_EVENT(ON_CHANGE,m_radio_zerar_por_horario,OnChangeZerarPorHorario)
   ON_EVENT(ON_CHANGE,m_combo_horario_zerar_hora,OnChangeHorarioZerarHora)
   ON_EVENT(ON_CHANGE,m_combo_horario_zerar_min,OnChangeHorarioZerarMin)
   ON_EVENT(ON_CHANGE,m_combo_tempo_grafico,OnChangeTempoGrafico)
   ON_EVENT(ON_END_EDIT,m_edit_volume_inicial,OnEndEditVolumeInicial)
   ON_EVENT(ON_END_EDIT,m_edit_spread_maximo,OnEndEditSpreadMaximo)
   ON_EVENT(ON_END_EDIT,m_edit_stoploss_calculo_qtd_candle,OnEndEditStoplossCalculoQtdCandle)
   ON_EVENT(ON_END_EDIT,m_edit_stoploss_calculo_multiplicar_candle,OnEndEditStoplossCalculoMultiplicarCandle)
   ON_EVENT(ON_END_EDIT,m_edit_stoploss_calculo_multiplicar_mult,OnEndEditStoplossCalculoMultiplicarMult)
   ON_EVENT(ON_CHANGE,m_radio_stoploss_use,OnChangeStoplossUse)
   ON_EVENT(ON_CHANGE,m_radio_stoploss_mode,OnChangeStoplossMode)
   ON_EVENT(ON_CHANGE,m_combo_stoploss_calculo_base_referencia,OnChangeStoplossCalculoBaseReferencia)
   ON_EVENT(ON_CHANGE,m_combo_stoploss_referencia_base,OnChangeStoplossReferenciaBase)
   ON_EVENT(ON_CHANGE,m_combo_stoploss_referencia_candle,OnChangeStoplossReferenciaCandle)
   ON_EVENT(ON_CHANGE,m_combo_tipo_stoploss,OnChangeTipoStoploss)
   ON_EVENT(ON_CLICK,m_button_execute,OnClickExecutar)
EVENT_MAP_END(CAppDialog)

CConstrutorDialog ExtDialog;

CConstrutorDialog::CConstrutorDialog(void) : m_active_tab(-1),
                                             m_painel_compacto(false)
  {
  }

bool CConstrutorDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
     {
      PrintFormat("Construtor: CAppDialog.Create falhou. err=%d",GetLastError());
      return(false);
     }

   Caption("Construtor Visual  |  Arraste pelo topo");
   m_rect_original.SetBound(x1,y1,x2,y2);

   if(!CreateSidebar())
     {
      Print("Construtor: CreateSidebar falhou");
      return(false);
     }
   if(!CreateContent())
     {
      Print("Construtor: CreateContent falhou");
      return(false);
     }
   if(!CreateTab1Form())
     {
      Print("Construtor: CreateTab1Form falhou");
      return(false);
     }
   AtualizarControlesComConfig();
   ChartRedraw(m_chart_id);
   SelectTab(0);
   return(true);
  }

bool CConstrutorDialog::CreatePanelBlock(CPanel &panel,const string name,const int x1,const int y1,const int x2,const int y2,const color background,const color border)
  {
   if(!panel.Create(m_chart_id,name,m_subwin,x1,y1,x2,y2))
      return(false);
   if(!panel.ColorBackground(background))
      return(false);
   if(!panel.ColorBorder(border))
      return(false);
   if(!panel.BorderType(BORDER_FLAT))
      return(false);
   return(Add(panel));
  }

bool CConstrutorDialog::CreateRadioCard(CPanel &panel,const string name,const int x1,const int y1,const int x2,const int y2)
  {
   return(CreatePanelBlock(panel,name,x1,y1,x2,y2,clrWhite,COLOR_SECTION_BORDER));
  }

bool CConstrutorDialog::CreateText(CLabel &label,const string name,const int x,const int y,const string text,const color text_color,const int font_size,const string font_name)
  {
   if(!label.Create(m_chart_id,name,m_subwin,x,y,x + 10,y + 10))
      return(false);
   if(!label.Text(text))
      return(false);
   if(!label.Color(text_color))
      return(false);
   if(!label.Font(font_name))
      return(false);
   if(!label.FontSize(font_size))
      return(false);
   return(Add(label));
  }

bool CConstrutorDialog::CreateTabButton(CButton &button,const string name,const string text,const int x1,const int y1,const int x2,const int y2)
  {
   if(!button.Create(m_chart_id,name,m_subwin,x1,y1,x2,y2))
      return(false);
   if(!button.Text(text))
      return(false);
   if(!button.Font("Segoe UI"))
      return(false);
   if(!button.FontSize(10))
      return(false);
   if(!button.Color(COLOR_TAB_TEXT))
      return(false);
   if(!button.ColorBackground(COLOR_TAB_BG))
      return(false);
   if(!button.ColorBorder(COLOR_TAB_BORDER))
      return(false);
   return(Add(button));
  }

bool CConstrutorDialog::PopularComboIntervalo(CComboBox &combo,const int inicio,const int fim)
  {
   for(int i = inicio; i <= fim; i++)
     {
      if(!combo.AddItem(StringFormat("%02d",i),i))
         return(false);
     }

   return(true);
  }

bool CConstrutorDialog::PopularComboTempoGrafico(CComboBox &combo)
  {
   const string tempos[] =
     {
      "CORRENTE",
      "M1",
      "M2",
      "M3",
      "M4",
      "M5",
      "M6",
      "M10",
      "M12",
      "M15",
      "M30",
      "H1",
      "H2",
      "H3",
      "H4",
      "H6",
      "H8",
      "H12",
      "D1",
      "W1",
      "MN1"
     };

   for(int i = 0; i < ArraySize(tempos); i++)
     {
      if(!combo.AddItem(tempos[i],i))
         return(false);
     }

   return(true);
  }

bool CConstrutorDialog::PopularComboTipoCalculoDistancias(CComboBox &combo)
  {
   if(!combo.AddItem("Pontos",EM_PONTOS))
      return(false);
   if(!combo.AddItem("Percentual",PERCENTUAL))
      return(false);

   return(true);
  }

bool CConstrutorDialog::PopularComboBaseReferenciaCalculo(CComboBox &combo)
  {
   if(!combo.AddItem("Maxima",REFERENCIA_MAXIMA))
      return(false);
   if(!combo.AddItem("Minima",REFERENCIA_MINIMA))
      return(false);
   if(!combo.AddItem("Abertura",REFERENCIA_ABERTURA))
      return(false);
   if(!combo.AddItem("Fechamento",REFERENCIA_FECHAMENTO))
      return(false);

   return(true);
  }

bool CConstrutorDialog::PopularComboBaseReferenciaMultiplicar(CComboBox &combo)
  {
   if(!combo.AddItem("Corpo",MULTIPLICAR_CORPO))
      return(false);
   if(!combo.AddItem("Pavios",MULTIPLICAR_PAVIOS))
      return(false);

   return(true);
  }

bool CConstrutorDialog::PopularComboCandleReferencia(CComboBox &combo)
  {
   if(!combo.AddItem("Atual",CANDLE_ATUAL))
      return(false);
   if(!combo.AddItem("Ultimo",CANDLE_ULTIMO))
      return(false);
   if(!combo.AddItem("Penultimo",CANDLE_PENULTIMO))
      return(false);
   if(!combo.AddItem("Antepenultimo",CANDLE_ANTEPENULTIMO))
      return(false);
   if(!combo.AddItem("Anteantepenultimo",CANDLE_ANTEANTEPENULTIMO))
      return(false);
   if(!combo.AddItem("Anteanteantepenultimo",CANDLE_ANTEANTEANTEPENULTIMO))
      return(false);

   return(true);
  }

string CConstrutorDialog::FormatarDecimalCurto(const double valor)
  {
   string texto = DoubleToString(valor,2);

   while(StringLen(texto) > 0 && StringSubstr(texto,StringLen(texto) - 1,1) == "0")
      texto = StringSubstr(texto,0,StringLen(texto) - 1);
   if(StringLen(texto) > 0 && StringSubstr(texto,StringLen(texto) - 1,1) == ".")
      texto = StringSubstr(texto,0,StringLen(texto) - 1);

   return(texto);
  }

bool CConstrutorDialog::CreateSidebar(void)
  {
   const int client_height = ClientAreaHeight();
   const int sidebar_x1    = 16;
   const int sidebar_y1    = 16;
   const int sidebar_x2    = sidebar_x1 + 206;
   const int sidebar_y2    = client_height - 16;

   if(!CreatePanelBlock(m_sidebar,m_name+"Sidebar",sidebar_x1,sidebar_y1,sidebar_x2,sidebar_y2,COLOR_SIDEBAR_BG,COLOR_SIDEBAR_BORDER))
      return(false);

   if(!CreatePanelBlock(m_sidebar_ribbon,m_name+"SidebarRibbon",sidebar_x1 + 24,sidebar_y1 + 24,sidebar_x1 + 92,sidebar_y1 + 28,COLOR_ACCENT,COLOR_ACCENT))
      return(false);

   if(!CreateText(m_brand_title,m_name+"BrandTitle",sidebar_x1 + 24,sidebar_y1 + 40,"Construtor",C'245,242,236',16))
      return(false);

   const int tab_x1     = sidebar_x1 + 24;
   const int tab_x2     = sidebar_x2 - 24;
   const int tab_height = 25;
   const int tab_gap    = 7;
   const int first_y    = sidebar_y1 + 92;

   if(!CreateTabButton(m_tab_1,m_name+"Tab1",g_tab_names[0],tab_x1,first_y + (tab_height + tab_gap) * 0,tab_x2,first_y + (tab_height + tab_gap) * 0 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_2,m_name+"Tab2",g_tab_names[1],tab_x1,first_y + (tab_height + tab_gap) * 1,tab_x2,first_y + (tab_height + tab_gap) * 1 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_3,m_name+"Tab3",g_tab_names[2],tab_x1,first_y + (tab_height + tab_gap) * 2,tab_x2,first_y + (tab_height + tab_gap) * 2 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_4,m_name+"Tab4",g_tab_names[3],tab_x1,first_y + (tab_height + tab_gap) * 3,tab_x2,first_y + (tab_height + tab_gap) * 3 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_5,m_name+"Tab5",g_tab_names[4],tab_x1,first_y + (tab_height + tab_gap) * 4,tab_x2,first_y + (tab_height + tab_gap) * 4 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_6,m_name+"Tab6",g_tab_names[5],tab_x1,first_y + (tab_height + tab_gap) * 5,tab_x2,first_y + (tab_height + tab_gap) * 5 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_7,m_name+"Tab7",g_tab_names[6],tab_x1,first_y + (tab_height + tab_gap) * 6,tab_x2,first_y + (tab_height + tab_gap) * 6 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_8,m_name+"Tab8",g_tab_names[7],tab_x1,first_y + (tab_height + tab_gap) * 7,tab_x2,first_y + (tab_height + tab_gap) * 7 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_9,m_name+"Tab9",g_tab_names[8],tab_x1,first_y + (tab_height + tab_gap) * 8,tab_x2,first_y + (tab_height + tab_gap) * 8 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_10,m_name+"Tab10",g_tab_names[9],tab_x1,first_y + (tab_height + tab_gap) * 9,tab_x2,first_y + (tab_height + tab_gap) * 9 + tab_height))
      return(false);
   if(!CreateTabButton(m_tab_11,m_name+"Tab11",g_tab_names[10],tab_x1,first_y + (tab_height + tab_gap) * 10,tab_x2,first_y + (tab_height + tab_gap) * 10 + tab_height))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateContent(void)
  {
   const int client_width  = ClientAreaWidth();
   const int client_height = ClientAreaHeight();
   const int content_x1    = 238;
   const int content_y1    = 16;
   const int content_x2    = client_width - 16;
   const int content_y2    = client_height - 16;

   if(!CreatePanelBlock(m_content,m_name+"Content",content_x1,content_y1,content_x2,content_y2,COLOR_CONTENT_BG,COLOR_CONTENT_BORDER))
      return(false);

   if(!CreatePanelBlock(m_content_strip,m_name+"ContentStrip",content_x1 + 28,content_y1 + 28,content_x1 + 36,content_y1 + 186,COLOR_ACCENT,COLOR_ACCENT))
      return(false);

   if(!CreateText(m_content_tag,m_name+"ContentTag",content_x1 + 52,content_y1 + 30,"ABERTO EM PAINEL",COLOR_ACCENT,9))
      return(false);
   if(!CreateText(m_content_title,m_name+"ContentTitle",content_x1 + 52,content_y1 + 56,g_tab_names[0] + " - " + g_tab_roles[0],COLOR_TEXT_DARK,18))
      return(false);
   if(!CreateText(m_content_summary,m_name+"ContentSummary",content_x1 + 52,content_y1 + 92,g_tab_summaries[0],COLOR_TEXT_MUTED,10))
      return(false);
   if(!CreateText(m_content_line_1,m_name+"ContentLine1",content_x1 + 52,content_y1 + 130,g_tab_notes[0],COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateText(m_content_line_2,m_name+"ContentLine2",content_x1 + 52,content_y1 + 156,"- Estrutura limpa para reconstruir os blocos de configuracao.",COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateText(m_content_line_3,m_name+"ContentLine3",content_x1 + 52,content_y1 + 182,"- Cada aba fica reservada para receber o proximo bloco do zero.",COLOR_TEXT_DARK,10))
      return(false);

   if(!CreatePanelBlock(m_divider,m_name+"Divider",content_x1 + 28,content_y1 + 214,content_x2 - 28,content_y1 + 215,COLOR_SECTION_BORDER,COLOR_SECTION_BORDER))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateTab1Form(void)
  {
   const int client_width = ClientAreaWidth();
   const int client_height = ClientAreaHeight();
   const int content_x1 = 238;
   const int content_x2 = client_width - 16;
   const int cards_x1 = content_x1 + 28;
   const int cards_x2 = content_x2 - 28;
   const int cards_y1 = 248;
   const int cards_y2 = client_height - 34;
   const int cards_gap = 36;
   const int cards_width = ((cards_x2 - cards_x1) - cards_gap) / 2;
   const int left_x1 = cards_x1;
   const int left_x2 = left_x1 + cards_width;
   const int right_x1 = left_x2 + cards_gap;
   const int right_x2 = cards_x2;

   if(!CreatePanelBlock(m_section_principal,m_name+"SectionPrincipal",left_x1,cards_y1,left_x2,cards_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);
   if(!CreatePanelBlock(m_section_direcao,m_name+"SectionDirecao",right_x1,cards_y1,right_x2,cards_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);

   if(!CreateText(m_section_principal_title,m_name+"SectionPrincipalTitle",left_x1 + 18,cards_y1 + 16,"Informacoes basicas",COLOR_TEXT_DARK,12))
      return(false);
   if(!CreateText(m_section_principal_note,m_name+"SectionPrincipalNote",left_x1 + 18,cards_y1 + 38,"Os seletores abaixo refletem os inputs do EA e vice versa.",COLOR_TEXT_MUTED,8))
      return(false);

   if(!CreateText(m_label_nome,m_name+"LabelNome",left_x1 + 18,cards_y1 + 72,"Nome da Estrategia",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_nome.Create(m_chart_id,m_name+"EditNome",m_subwin,left_x1 + 18,cards_y1 + 92,left_x2 - 18,cards_y1 + 116))
      return(false);
   if(!m_edit_nome.Font("Segoe UI"))
      return(false);
   if(!m_edit_nome.FontSize(10))
      return(false);
   if(!m_edit_nome.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_nome.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_nome.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_nome))
      return(false);

   if(!CreateText(m_label_mercado,m_name+"LabelMercado",left_x1 + 18,cards_y1 + 132,"Mercado desejado",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_mercado.Create(m_chart_id,m_name+"ComboMercado",m_subwin,left_x1 + 18,cards_y1 + 152,left_x2 - 18,cards_y1 + 176))
      return(false);
   if(!Add(m_combo_mercado))
      return(false);
   if(!m_combo_mercado.AddItem("B3",CONSTRUTOR_B3))
      return(false);
   if(!m_combo_mercado.AddItem("Forex",CONSTRUTOR_FOREX))
      return(false);

   if(!CreateText(m_label_operacional,m_name+"LabelOperacional",left_x1 + 18,cards_y1 + 188,"Tipo operacional",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_operacional.Create(m_chart_id,m_name+"ComboOperacional",m_subwin,left_x1 + 18,cards_y1 + 208,left_x2 - 18,cards_y1 + 232))
      return(false);
   if(!Add(m_combo_operacional))
      return(false);
   if(!m_combo_operacional.AddItem("Day trade",CONSTRUTOR_DAY_TRADE))
      return(false);
   if(!m_combo_operacional.AddItem("Swing trade",CONSTRUTOR_SWING_TRADE))
      return(false);

   if(!CreateText(m_label_modo,m_name+"LabelModo",left_x1 + 18,cards_y1 + 244,"Modo de processamento",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_modo.Create(m_chart_id,m_name+"ComboModo",m_subwin,left_x1 + 18,cards_y1 + 264,left_x2 - 18,cards_y1 + 288))
      return(false);
   if(!Add(m_combo_modo))
      return(false);
   if(!m_combo_modo.AddItem("Cada tick",CONSTRUTOR_CADA_TICK))
      return(false);
   if(!m_combo_modo.AddItem("Cada segundo",CONSTRUTOR_CADA_SEGUNDO))
      return(false);

   SetTab1ControlsVisible(false);
   return(true);
  }

bool CConstrutorDialog::CreateTab2Form(void)
  {
   return(true);

   const int client_width  = ClientAreaWidth();
   const int client_height = ClientAreaHeight();
   const int content_x1    = 238;
   const int content_x2    = client_width - 16;
   const int content_y2    = client_height - 16;
   const int section_y1    = 232;
   const int section_y2    = content_y2 - 74;
   const int left_x1       = content_x1 + 28;
   const int right_margin  = 28;
   const int gap_x         = 18;
   const int usable_width  = (content_x2 - content_x1) - left_x1 + content_x1 - right_margin;
   const int section_w     = (usable_width - gap_x) / 2;
   const int left_x2       = left_x1 + section_w;
   const int right_x1      = left_x2 + gap_x;
   const int right_x2      = content_x2 - right_margin;
   const int combo_gap     = 12;
   const int combo_w_left  = ((left_x2 - left_x1) - 54 - combo_gap) / 2;
   const int combo_w_right = ((right_x2 - right_x1) - 54 - combo_gap) / 2;

   if(!CreatePanelBlock(m_section_horario_janela,m_name+"SectionHorarioJanela",left_x1,section_y1,left_x2,section_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);
   if(!CreatePanelBlock(m_section_horario_zerar,m_name+"SectionHorarioZerar",right_x1,section_y1,right_x2,section_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);

   if(!CreateText(m_section_horario_janela_title,m_name+"SectionHorarioJanelaTitle",left_x1 + 18,section_y1 + 16,"Janela de operacao",COLOR_TEXT_DARK,12))
      return(false);
   if(!CreateText(m_section_horario_janela_note,m_name+"SectionHorarioJanelaNote",left_x1 + 18,section_y1 + 38,"Defina quando as operacoes podem comecar e encerrar.",COLOR_TEXT_MUTED,8))
      return(false);

   if(!CreateText(m_label_horario_inicial_hora,m_name+"LabelHorarioInicialHora",left_x1 + 18,section_y1 + 76,"Horario inicial",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_horario_inicial_hora.Create(m_chart_id,m_name+"ComboHorarioInicialHora",m_subwin,left_x1 + 18,section_y1 + 96,left_x1 + 18 + combo_w_left,section_y1 + 120))
      return(false);
   if(!Add(m_combo_horario_inicial_hora))
      return(false);
   if(!PopularComboIntervalo(m_combo_horario_inicial_hora,0,23))
      return(false);

   if(!CreateText(m_label_horario_inicial_min,m_name+"LabelHorarioInicialMin",left_x1 + 18 + combo_w_left + combo_gap,section_y1 + 76,"Minuto inicial",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_horario_inicial_min.Create(m_chart_id,m_name+"ComboHorarioInicialMin",m_subwin,left_x1 + 18 + combo_w_left + combo_gap,section_y1 + 96,left_x2 - 18,section_y1 + 120))
      return(false);
   if(!Add(m_combo_horario_inicial_min))
      return(false);
   if(!PopularComboIntervalo(m_combo_horario_inicial_min,0,59))
      return(false);

   if(!CreateText(m_label_horario_final_hora,m_name+"LabelHorarioFinalHora",left_x1 + 18,section_y1 + 146,"Horario final",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_horario_final_hora.Create(m_chart_id,m_name+"ComboHorarioFinalHora",m_subwin,left_x1 + 18,section_y1 + 166,left_x1 + 18 + combo_w_left,section_y1 + 190))
      return(false);
   if(!Add(m_combo_horario_final_hora))
      return(false);
   if(!PopularComboIntervalo(m_combo_horario_final_hora,0,23))
      return(false);

   if(!CreateText(m_label_horario_final_min,m_name+"LabelHorarioFinalMin",left_x1 + 18 + combo_w_left + combo_gap,section_y1 + 146,"Minuto final",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_horario_final_min.Create(m_chart_id,m_name+"ComboHorarioFinalMin",m_subwin,left_x1 + 18 + combo_w_left + combo_gap,section_y1 + 166,left_x2 - 18,section_y1 + 190))
      return(false);
   if(!Add(m_combo_horario_final_min))
      return(false);
   if(!PopularComboIntervalo(m_combo_horario_final_min,0,59))
      return(false);

   if(!CreateText(m_section_horario_zerar_title,m_name+"SectionHorarioZerarTitle",right_x1 + 18,section_y1 + 16,"Encerramento por horario",COLOR_TEXT_DARK,12))
      return(false);
   if(!CreateText(m_section_horario_zerar_note,m_name+"SectionHorarioZerarNote",right_x1 + 18,section_y1 + 38,"Se ligado, libera hora e minuto para zerar posicoes.",COLOR_TEXT_MUTED,8))
      return(false);

   if(!CreateText(m_label_zerar_por_horario,m_name+"LabelZerarPorHorario",right_x1 + 18,section_y1 + 76,"Deseja zerar por horario?",COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateRadioCard(m_card_zerar,m_name+"CardZerar",right_x1 + 14,section_y1 + 100,right_x2 - 14,section_y1 + 158))
      return(false);
   if(!m_radio_zerar_por_horario.Create(m_chart_id,m_name+"RadioZerarPorHorario",m_subwin,right_x1 + 18,section_y1 + 104,right_x2 - 18,section_y1 + 140))
      return(false);
   if(!m_radio_zerar_por_horario.AddItem("Sim",1))
      return(false);
   if(!m_radio_zerar_por_horario.AddItem("Nao",0))
      return(false);
   if(!Add(m_radio_zerar_por_horario))
      return(false);

   if(!CreateText(m_label_horario_zerar_hora,m_name+"LabelHorarioZerarHora",right_x1 + 18,section_y1 + 168,"Horario de encerramento",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_horario_zerar_hora.Create(m_chart_id,m_name+"ComboHorarioZerarHora",m_subwin,right_x1 + 18,section_y1 + 188,right_x1 + 18 + combo_w_right,section_y1 + 212))
      return(false);
   if(!Add(m_combo_horario_zerar_hora))
      return(false);
   if(!PopularComboIntervalo(m_combo_horario_zerar_hora,0,23))
      return(false);

   if(!CreateText(m_label_horario_zerar_min,m_name+"LabelHorarioZerarMin",right_x1 + 18 + combo_w_right + combo_gap,section_y1 + 168,"Minuto de encerramento",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_horario_zerar_min.Create(m_chart_id,m_name+"ComboHorarioZerarMin",m_subwin,right_x1 + 18 + combo_w_right + combo_gap,section_y1 + 188,right_x2 - 18,section_y1 + 212))
      return(false);
   if(!Add(m_combo_horario_zerar_min))
      return(false);
   if(!PopularComboIntervalo(m_combo_horario_zerar_min,0,59))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateTab3Form(void)
  {
   return(true);

   const int client_width  = ClientAreaWidth();
   const int client_height = ClientAreaHeight();
   const int content_x1    = 238;
   const int content_x2    = client_width - 16;
   const int content_y2    = client_height - 16;
   const int section_y1    = 232;
   const int section_y2    = content_y2 - 74;
   const int left_x1       = content_x1 + 28;
   const int right_x2      = content_x2 - 28;
   const int usable_width  = right_x2 - left_x1;
   const int field_gap     = 18;
   const int field_w       = (usable_width - (field_gap * 2)) / 3;

   if(!CreatePanelBlock(m_section_config_inicial,m_name+"SectionConfigInicial",left_x1,section_y1,right_x2,section_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);

   if(!CreateText(m_section_config_inicial_title,m_name+"SectionConfigInicialTitle",left_x1 + 18,section_y1 + 16,"Configuracao inicial",COLOR_TEXT_DARK,12))
      return(false);
   if(!CreateText(m_section_config_inicial_note,m_name+"SectionConfigInicialNote",left_x1 + 18,section_y1 + 38,"Define o timeframe base, o volume inicial e o spread maximo da partida.",COLOR_TEXT_MUTED,8))
      return(false);

   if(!CreateText(m_label_tempo_grafico,m_name+"LabelTempoGrafico",left_x1 + 18,section_y1 + 76,"Tempo grafico",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_tempo_grafico.Create(m_chart_id,m_name+"ComboTempoGrafico",m_subwin,left_x1 + 18,section_y1 + 96,left_x1 + 18 + field_w,section_y1 + 120))
      return(false);
   if(!Add(m_combo_tempo_grafico))
      return(false);
   if(!PopularComboTempoGrafico(m_combo_tempo_grafico))
      return(false);

   if(!CreateText(m_label_volume_inicial,m_name+"LabelVolumeInicial",left_x1 + 18 + field_w + field_gap,section_y1 + 76,"Volume inicial",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_volume_inicial.Create(m_chart_id,m_name+"EditVolumeInicial",m_subwin,left_x1 + 18 + field_w + field_gap,section_y1 + 96,left_x1 + 18 + (field_w * 2) + field_gap,section_y1 + 120))
      return(false);
   if(!m_edit_volume_inicial.Font("Segoe UI"))
      return(false);
   if(!m_edit_volume_inicial.FontSize(10))
      return(false);
   if(!m_edit_volume_inicial.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_volume_inicial.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_volume_inicial.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_volume_inicial))
      return(false);

   if(!CreateText(m_label_spread_maximo,m_name+"LabelSpreadMaximo",left_x1 + 18 + (field_w * 2) + (field_gap * 2),section_y1 + 76,"Spread maximo",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_spread_maximo.Create(m_chart_id,m_name+"EditSpreadMaximo",m_subwin,left_x1 + 18 + (field_w * 2) + (field_gap * 2),section_y1 + 96,right_x2 - 18,section_y1 + 120))
      return(false);
   if(!m_edit_spread_maximo.Font("Segoe UI"))
      return(false);
   if(!m_edit_spread_maximo.FontSize(10))
      return(false);
   if(!m_edit_spread_maximo.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_spread_maximo.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_spread_maximo.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_spread_maximo))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateTab4Form(void)
  {
   return(true);

   const int client_width  = ClientAreaWidth();
   const int client_height = ClientAreaHeight();
   const int content_x1    = 238;
   const int content_x2    = client_width - 16;
   const int content_y2    = client_height - 16;
   const int section_y1    = 232;
   const int section_y2    = content_y2 - 74;
   const int left_x1       = content_x1 + 28;
   const int right_x2      = content_x2 - 28;
   const int stoploss_stack_shift_y = 80;
   const int stoploss_lower_shift_y = stoploss_stack_shift_y + 10;
   const int stoploss_use_label_y1 = section_y1 + 116 - stoploss_stack_shift_y;
   const int stoploss_use_card_y1 = section_y1 + 136 - stoploss_stack_shift_y;
   const int stoploss_use_card_x1 = left_x1 + 14;
   const int stoploss_use_card_x2 = left_x1 + 362;
   const int stoploss_type_column_x1 = stoploss_use_card_x2 + 18;
   const int stoploss_type_label_x1 = stoploss_type_column_x1;
   const int stoploss_type_label_y1 = stoploss_use_label_y1;
   const int stoploss_type_combo_x1 = stoploss_type_column_x1;
   const int stoploss_type_combo_y1 = stoploss_use_card_y1;
   const int stoploss_type_combo_x2 = right_x2 - 18;
   const int stoploss_cards_x1 = left_x1 + 14;
   const int stoploss_cards_x2 = right_x2 - 14;
   const int stoploss_card_gap = 12;
   const int stoploss_card_column_w = (stoploss_cards_x2 - stoploss_cards_x1 - (stoploss_card_gap * 2)) / 3;
   const int stoploss_card1_x1 = stoploss_cards_x1;
   const int stoploss_card1_x2 = stoploss_card1_x1 + stoploss_card_column_w;
   const int stoploss_card2_x1 = stoploss_card1_x2 + stoploss_card_gap;
   const int stoploss_card2_x2 = stoploss_card2_x1 + stoploss_card_column_w;
   const int stoploss_card3_x1 = stoploss_card2_x2 + stoploss_card_gap;
   const int stoploss_card3_x2 = stoploss_cards_x2;
   const int stoploss_card_bottom_y1 = section_y1 + 198 - stoploss_lower_shift_y;
   const int stoploss_card_bottom_y2 = section_y2 - 8;
   const int stoploss_fixo_title_y1 = stoploss_card_bottom_y1 - 18;
   const int stoploss_fixo_check_y1 = stoploss_card_bottom_y1 + 12;
   const int stoploss_fixo_dist_y1  = stoploss_card_bottom_y1 + 40;
   const int stoploss_fixo_edit_y1  = stoploss_card_bottom_y1 + 62;
   const int stoploss_calc_title_y1 = stoploss_card_bottom_y1 - 18;
   const int stoploss_calc_inner_y1 = stoploss_card_bottom_y1 + 104;
   const int stoploss_calc_inner_y2 = stoploss_card_bottom_y2 - 8;
   const int stoploss_calc_inner_x1 = stoploss_card2_x1 + 4;
   const int stoploss_calc_inner_x2 = stoploss_card2_x2 - 4;
   const int stoploss_calc_inner_gap = 10;
   const int stoploss_calc_inner_w = (stoploss_calc_inner_x2 - stoploss_calc_inner_x1 - stoploss_calc_inner_gap) / 2;
   const int stoploss_calc_media_x1 = stoploss_calc_inner_x1;
   const int stoploss_calc_media_x2 = stoploss_calc_media_x1 + stoploss_calc_inner_w;
   const int stoploss_calc_multiplicar_x1 = stoploss_calc_media_x2 + stoploss_calc_inner_gap;
   const int stoploss_calc_multiplicar_x2 = stoploss_calc_inner_x2;
   const int stoploss_calc_sub_title_y1 = stoploss_calc_inner_y1 + 2;
   const int stoploss_calc_sub_check_y1 = stoploss_calc_inner_y1 + 24;
   const int stoploss_calc_media_qtd_y1 = stoploss_calc_sub_check_y1 + 22;
   const int stoploss_calc_media_qtd_edit_y1 = stoploss_calc_media_qtd_y1 + 18;
   const int stoploss_calc_media_base_y1 = stoploss_calc_media_qtd_edit_y1 + 32;
   const int stoploss_calc_media_base_combo_y1 = stoploss_calc_media_base_y1 + 18;
   const int stoploss_calc_multiplicar_base_y1 = stoploss_calc_sub_check_y1 + 20;
   const int stoploss_calc_multiplicar_base_combo_y1 = stoploss_calc_multiplicar_base_y1 + 18;
   const int stoploss_calc_multiplicar_inputs_y1 = stoploss_calc_multiplicar_base_combo_y1 + 30;
   const int stoploss_calc_multiplicar_inputs_edit_y1 = stoploss_calc_multiplicar_inputs_y1 + 18;
   const int stoploss_calc_multiplicar_input_gap = 8;
   const int stoploss_calc_multiplicar_input_w = ((stoploss_calc_multiplicar_x2 - stoploss_calc_multiplicar_x1 - 8) - stoploss_calc_multiplicar_input_gap) / 2;
   const int stoploss_calc_multiplicar_candle_x2 = stoploss_calc_multiplicar_x1 + 4 + stoploss_calc_multiplicar_input_w;
   const int stoploss_calc_multiplicar_mult_x1 = stoploss_calc_multiplicar_candle_x2 + stoploss_calc_multiplicar_input_gap;
   const int stoploss_ref_title_y1 = stoploss_card_bottom_y1 - 18;
   const int stoploss_ref_check_y1 = stoploss_card_bottom_y1 + 12;
   const int stoploss_ref_base_label_y1 = stoploss_card_bottom_y1 + 38;
   const int stoploss_ref_base_combo_y1 = stoploss_ref_base_label_y1 + 18;
   const int stoploss_ref_candle_label_y1 = stoploss_ref_base_combo_y1 + 32;
   const int stoploss_ref_candle_combo_y1 = stoploss_ref_candle_label_y1 + 18;

   if(!CreatePanelBlock(m_section_stoploss,m_name+"SectionStoploss",left_x1,section_y1,right_x2,section_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);

   if(!CreateText(m_section_stoploss_title,m_name+"SectionStoplossTitle",left_x1 + 18,section_y1 + 16,"Stop loss inicial",COLOR_TEXT_DARK,12))
      return(false);
   if(!CreateText(m_section_stoploss_note,m_name+"SectionStoplossNote",left_x1 + 18,section_y1 + 38,"",COLOR_TEXT_MUTED,8))
      return(false);

   if(!CreatePanelBlock(m_card_stoploss_fixo,m_name+"CardStoplossFixo",stoploss_card1_x1,stoploss_card_bottom_y1,stoploss_card1_x2,stoploss_card_bottom_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);

   if(!CreateText(m_label_stoploss_fixo,m_name+"LabelStoplossFixo",stoploss_card1_x1 + 4,stoploss_fixo_title_y1,"Stoploss fixo",COLOR_TEXT_DARK,10))
      return(false);

   if(!CreateText(m_label_stoploss_distancia,m_name+"LabelStoplossDistancia",stoploss_card1_x1 + 4,stoploss_fixo_dist_y1,"Distancia",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_stoploss_distancia.Create(m_chart_id,m_name+"EditStoplossDistancia",m_subwin,stoploss_card1_x1 + 4,stoploss_fixo_edit_y1,stoploss_card1_x2 - 18,stoploss_fixo_edit_y1 + 24))
      return(false);
   if(!m_edit_stoploss_distancia.Font("Segoe UI"))
      return(false);
   if(!m_edit_stoploss_distancia.FontSize(10))
      return(false);
   if(!m_edit_stoploss_distancia.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_stoploss_distancia.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_stoploss_distancia.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_stoploss_distancia))
      return(false);

   if(!CreatePanelBlock(m_card_stoploss_calculo,m_name+"CardStoplossCalculo",stoploss_card2_x1,stoploss_card_bottom_y1,stoploss_card2_x2,stoploss_card_bottom_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);
   if(!CreateText(m_label_stoploss_calculo,m_name+"LabelStoplossCalculo",stoploss_card2_x1 + 4,stoploss_calc_title_y1,"Modo de stop",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_radio_stoploss_mode.Create(m_chart_id,m_name+"RadioStoplossMode",m_subwin,stoploss_card2_x1 + 4,stoploss_calc_title_y1 + 20,stoploss_card2_x2 - 4,stoploss_calc_title_y1 + 92))
      return(false);
   if(!m_radio_stoploss_mode.AddItem("Fixo",0))
      return(false);
   if(!m_radio_stoploss_mode.AddItem("Media",1))
      return(false);
   if(!m_radio_stoploss_mode.AddItem("Multiplicar",2))
      return(false);
   if(!m_radio_stoploss_mode.AddItem("Referencia",3))
      return(false);
   if(!Add(m_radio_stoploss_mode))
      return(false);

   if(!CreatePanelBlock(m_card_stoploss_calculo_media,m_name+"CardStoplossCalculoMedia",stoploss_calc_media_x1,stoploss_calc_inner_y1,stoploss_calc_media_x2,stoploss_calc_inner_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);
   if(!CreateText(m_label_stoploss_calculo_media,m_name+"LabelStoplossCalculoMedia",stoploss_calc_media_x1 + 4,stoploss_calc_sub_title_y1,"Media",COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateText(m_label_stoploss_calculo_qtd_candle,m_name+"LabelStoplossCalculoQtdCandle",stoploss_calc_media_x1 + 4,stoploss_calc_media_qtd_y1,"Qtd candle",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_stoploss_calculo_qtd_candle.Create(m_chart_id,m_name+"EditStoplossCalculoQtdCandle",m_subwin,stoploss_calc_media_x1 + 4,stoploss_calc_media_qtd_edit_y1,stoploss_calc_media_x1 + 84,stoploss_calc_media_qtd_edit_y1 + 24))
      return(false);
   if(!m_edit_stoploss_calculo_qtd_candle.Font("Segoe UI"))
      return(false);
   if(!m_edit_stoploss_calculo_qtd_candle.FontSize(10))
      return(false);
   if(!m_edit_stoploss_calculo_qtd_candle.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_stoploss_calculo_qtd_candle.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_stoploss_calculo_qtd_candle.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_stoploss_calculo_qtd_candle))
      return(false);
   m_edit_stoploss_calculo_qtd_candle.Text("3");

   if(!CreateText(m_label_stoploss_calculo_base_referencia,m_name+"LabelStoplossCalculoBaseReferencia",stoploss_calc_media_x1 + 4,stoploss_calc_media_base_y1,"Base da referencia",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_stoploss_calculo_base_referencia.Create(m_chart_id,m_name+"ComboStoplossCalculoBaseReferencia",m_subwin,stoploss_calc_media_x1 + 4,stoploss_calc_media_base_combo_y1,stoploss_calc_media_x2 - 4,stoploss_calc_media_base_combo_y1 + 24))
      return(false);
   if(!Add(m_combo_stoploss_calculo_base_referencia))
      return(false);
   if(!PopularComboBaseReferenciaCalculo(m_combo_stoploss_calculo_base_referencia))
      return(false);

   if(!CreatePanelBlock(m_card_stoploss_calculo_multiplicar,m_name+"CardStoplossCalculoMultiplicar",stoploss_calc_multiplicar_x1,stoploss_calc_inner_y1,stoploss_calc_multiplicar_x2,stoploss_calc_inner_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);
   if(!CreateText(m_label_stoploss_calculo_multiplicar,m_name+"LabelStoplossCalculoMultiplicar",stoploss_calc_multiplicar_x1 + 4,stoploss_calc_sub_title_y1,"Multiplicar",COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateText(m_label_stoploss_calculo_base_multiplicar,m_name+"LabelStoplossCalculoBaseMultiplicar",stoploss_calc_multiplicar_x1 + 4,stoploss_calc_multiplicar_base_y1,"Base da referencia",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_stoploss_calculo_base_multiplicar.Create(m_chart_id,m_name+"ComboStoplossCalculoBaseMultiplicar",m_subwin,stoploss_calc_multiplicar_x1 + 4,stoploss_calc_multiplicar_base_combo_y1,stoploss_calc_multiplicar_x2 - 4,stoploss_calc_multiplicar_base_combo_y1 + 24))
      return(false);
   if(!Add(m_combo_stoploss_calculo_base_multiplicar))
      return(false);
   if(!PopularComboBaseReferenciaMultiplicar(m_combo_stoploss_calculo_base_multiplicar))
      return(false);

   if(!CreateText(m_label_stoploss_calculo_multiplicar_candle,m_name+"LabelStoplossCalculoMultiplicarCandle",stoploss_calc_multiplicar_x1 + 4,stoploss_calc_multiplicar_inputs_y1,"Candle",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_candle.Create(m_chart_id,m_name+"EditStoplossCalculoMultiplicarCandle",m_subwin,stoploss_calc_multiplicar_x1 + 4,stoploss_calc_multiplicar_inputs_edit_y1,stoploss_calc_multiplicar_candle_x2,stoploss_calc_multiplicar_inputs_edit_y1 + 24))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_candle.Font("Segoe UI"))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_candle.FontSize(10))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_candle.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_candle.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_candle.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_stoploss_calculo_multiplicar_candle))
      return(false);
   m_edit_stoploss_calculo_multiplicar_candle.Text("3");

   if(!CreateText(m_label_stoploss_calculo_multiplicar_mult,m_name+"LabelStoplossCalculoMultiplicarMult",stoploss_calc_multiplicar_mult_x1,stoploss_calc_multiplicar_inputs_y1,"Mult",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_mult.Create(m_chart_id,m_name+"EditStoplossCalculoMultiplicarMult",m_subwin,stoploss_calc_multiplicar_mult_x1,stoploss_calc_multiplicar_inputs_edit_y1,stoploss_calc_multiplicar_x2 - 4,stoploss_calc_multiplicar_inputs_edit_y1 + 24))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_mult.Font("Segoe UI"))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_mult.FontSize(10))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_mult.Color(COLOR_TEXT_DARK))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_mult.ColorBackground(clrWhite))
      return(false);
   if(!m_edit_stoploss_calculo_multiplicar_mult.ColorBorder(COLOR_SECTION_BORDER))
      return(false);
   if(!Add(m_edit_stoploss_calculo_multiplicar_mult))
      return(false);
   m_edit_stoploss_calculo_multiplicar_mult.Text("1");

   if(!CreatePanelBlock(m_card_stoploss_referencia,m_name+"CardStoplossReferencia",stoploss_card3_x1,stoploss_card_bottom_y1,stoploss_card3_x2,stoploss_card_bottom_y2,COLOR_SECTION_BG,COLOR_SECTION_BORDER))
      return(false);
   if(!CreateText(m_label_stoploss_referencia,m_name+"LabelStoplossReferencia",stoploss_card3_x1 + 4,stoploss_ref_title_y1,"Referencia de preco",COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateText(m_label_stoploss_referencia_base,m_name+"LabelStoplossReferenciaBase",stoploss_card3_x1 + 4,stoploss_ref_base_label_y1,"Referencia:",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_stoploss_referencia_base.Create(m_chart_id,m_name+"ComboStoplossReferenciaBase",m_subwin,stoploss_card3_x1 + 4,stoploss_ref_base_combo_y1,stoploss_card3_x2 - 4,stoploss_ref_base_combo_y1 + 24))
      return(false);
   if(!Add(m_combo_stoploss_referencia_base))
      return(false);
   if(!PopularComboBaseReferenciaCalculo(m_combo_stoploss_referencia_base))
      return(false);

   if(!CreateText(m_label_stoploss_referencia_candle,m_name+"LabelStoplossReferenciaCandle",stoploss_card3_x1 + 4,stoploss_ref_candle_label_y1,"Candle:",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_stoploss_referencia_candle.Create(m_chart_id,m_name+"ComboStoplossReferenciaCandle",m_subwin,stoploss_card3_x1 + 4,stoploss_ref_candle_combo_y1,stoploss_card3_x2 - 4,stoploss_ref_candle_combo_y1 + 24))
      return(false);
   if(!Add(m_combo_stoploss_referencia_candle))
      return(false);
   if(!PopularComboCandleReferencia(m_combo_stoploss_referencia_candle))
      return(false);

   if(!CreateText(m_label_usar_stoploss,m_name+"LabelUsarStoploss",left_x1 + 18,stoploss_use_label_y1,"Usar stop loss?",COLOR_TEXT_DARK,10))
      return(false);
   if(!CreateRadioCard(m_card_stoploss,m_name+"CardStoploss",stoploss_use_card_x1,stoploss_use_card_y1,stoploss_use_card_x2,stoploss_use_card_y1 + 40))
      return(false);
   if(!m_radio_stoploss_use.Create(m_chart_id,m_name+"RadioStoplossUse",m_subwin,stoploss_use_card_x1 + 6,stoploss_use_card_y1 + 4,stoploss_use_card_x2 - 8,stoploss_use_card_y1 + 40))
      return(false);
   if(!m_radio_stoploss_use.AddItem("Sim",1))
      return(false);
   if(!m_radio_stoploss_use.AddItem("Nao",0))
      return(false);
   if(!Add(m_radio_stoploss_use))
      return(false);

   if(!CreateText(m_label_tipo_stoploss,m_name+"LabelTipoStoploss",stoploss_type_label_x1,stoploss_type_label_y1,"Tipo de stop:",COLOR_TEXT_DARK,10))
      return(false);
   if(!m_combo_tipo_stoploss.Create(m_chart_id,m_name+"ComboTipoStoploss",m_subwin,stoploss_type_combo_x1,stoploss_type_combo_y1,stoploss_type_combo_x2,stoploss_type_combo_y1 + 24))
      return(false);
   if(!Add(m_combo_tipo_stoploss))
      return(false);
   if(!PopularComboTipoCalculoDistancias(m_combo_tipo_stoploss))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateStatusArea(void)
  {
   return(true);

   const int client_width  = ClientAreaWidth();
   const int client_height = ClientAreaHeight();
   const int content_x1    = 238;
   const int content_x2    = client_width - 16;
   const int content_y2    = client_height - 16;

   if(!CreateText(m_status_label,m_name+"StatusLabel",content_x1 + 32,content_y2 - 40,"Aguardando configuracao.",COLOR_TEXT_MUTED,10))
      return(false);

   if(!m_button_execute.Create(m_chart_id,m_name+"ButtonExecutar",m_subwin,content_x2 - 190,content_y2 - 52,content_x2 - 28,content_y2 - 16))
      return(false);
   if(!m_button_execute.Text("Executar"))
      return(false);
   if(!m_button_execute.Font("Segoe UI"))
      return(false);
   if(!m_button_execute.FontSize(11))
      return(false);
   if(!m_button_execute.Color(clrWhite))
      return(false);
   if(!m_button_execute.ColorBackground(COLOR_ACCENT))
      return(false);
   if(!m_button_execute.ColorBorder(C'255,213,148'))
      return(false);
   if(!Add(m_button_execute))
      return(false);

   return(true);
  }

CButton *CConstrutorDialog::TabButtonByIndex(const int index)
  {
   switch(index)
     {
      case 0: return((CButton *)GetPointer(m_tab_1));
      case 1: return((CButton *)GetPointer(m_tab_2));
      case 2: return((CButton *)GetPointer(m_tab_3));
      case 3: return((CButton *)GetPointer(m_tab_4));
      case 4: return((CButton *)GetPointer(m_tab_5));
      case 5: return((CButton *)GetPointer(m_tab_6));
      case 6: return((CButton *)GetPointer(m_tab_7));
      case 7: return((CButton *)GetPointer(m_tab_8));
      case 8: return((CButton *)GetPointer(m_tab_9));
      case 9: return((CButton *)GetPointer(m_tab_10));
      case 10: return((CButton *)GetPointer(m_tab_11));
     }

   return(NULL);
  }

void CConstrutorDialog::StyleTabButton(CButton &button,const bool active)
  {
   button.Color(active ? clrWhite : COLOR_TAB_TEXT);
   button.ColorBackground(active ? COLOR_ACCENT : COLOR_TAB_BG);
   button.ColorBorder(active ? C'255,213,148' : COLOR_TAB_BORDER);
  }

void CConstrutorDialog::AplicarModoPainel(const bool compacto)
  {
   Size(m_rect_original.Width(),m_rect_original.Height());
   SetControlVisible(m_content_strip,true);
   SetControlVisible(m_divider,true);
   SetControlVisible(m_content_tag,true);
   SetControlVisible(m_content_title,true);
   SetControlVisible(m_content_summary,true);
   SetControlVisible(m_content_line_1,true);
   SetControlVisible(m_content_line_2,true);
   SetControlVisible(m_content_line_3,true);
   SetTab1ControlsVisible(m_active_tab == 0);
   m_painel_compacto = false;
   ChartRedraw(m_chart_id);
  }

void CConstrutorDialog::SetControlVisible(CWnd &control,const bool visible)
  {
   control.Visible(visible);
  }

void CConstrutorDialog::SetControlEnabled(CWnd &control,const bool enabled)
  {
   if(enabled)
      control.Enable();
   else
      control.Disable();
  }

void CConstrutorDialog::SyncRadioGroup(CRadioGroup &group,const long value)
  {
   group.Value(value);
  }

void CConstrutorDialog::SetTab1ControlsVisible(const bool visible)
  {
   SetControlVisible(m_section_principal,visible);
   SetControlVisible(m_section_direcao,visible);
   SetControlVisible(m_section_principal_title,visible);
   SetControlVisible(m_section_principal_note,visible);
   SetControlVisible(m_label_nome,visible);
   SetControlVisible(m_label_mercado,visible);
   SetControlVisible(m_label_operacional,visible);
   SetControlVisible(m_label_modo,visible);
   SetControlVisible(m_edit_nome,visible);
   SetControlVisible(m_combo_mercado,visible);
   SetControlVisible(m_combo_operacional,visible);
   SetControlVisible(m_combo_modo,visible);
  }

void CConstrutorDialog::SetTab2ControlsVisible(const bool visible)
  {
   SetControlVisible(m_section_horario_janela,visible);
   SetControlVisible(m_section_horario_zerar,visible);
   SetControlVisible(m_section_horario_janela_title,visible);
   SetControlVisible(m_section_horario_janela_note,visible);
   SetControlVisible(m_label_horario_inicial_hora,visible);
   SetControlVisible(m_label_horario_inicial_min,visible);
   SetControlVisible(m_label_horario_final_hora,visible);
   SetControlVisible(m_label_horario_final_min,visible);
   SetControlVisible(m_combo_horario_inicial_hora,visible);
   SetControlVisible(m_combo_horario_inicial_min,visible);
   SetControlVisible(m_combo_horario_final_hora,visible);
   SetControlVisible(m_combo_horario_final_min,visible);
   SetControlVisible(m_section_horario_zerar_title,visible);
   SetControlVisible(m_section_horario_zerar_note,visible);
   SetControlVisible(m_label_zerar_por_horario,visible);
   SetControlVisible(m_card_zerar,visible);
   SetControlVisible(m_radio_zerar_por_horario,visible);
   SetControlVisible(m_label_horario_zerar_hora,visible);
   SetControlVisible(m_label_horario_zerar_min,visible);
   SetControlVisible(m_combo_horario_zerar_hora,visible);
   SetControlVisible(m_combo_horario_zerar_min,visible);
  }

void CConstrutorDialog::SetTab3ControlsVisible(const bool visible)
  {
   SetControlVisible(m_section_config_inicial,visible);
   SetControlVisible(m_section_config_inicial_title,visible);
   SetControlVisible(m_section_config_inicial_note,visible);
   SetControlVisible(m_label_tempo_grafico,visible);
   SetControlVisible(m_label_volume_inicial,visible);
   SetControlVisible(m_label_spread_maximo,visible);
   SetControlVisible(m_combo_tempo_grafico,visible);
   SetControlVisible(m_edit_volume_inicial,visible);
   SetControlVisible(m_edit_spread_maximo,visible);
  }

void CConstrutorDialog::SetTab4ControlsVisible(const bool visible)
  {
   SetControlVisible(m_section_stoploss,visible);
   SetControlVisible(m_section_stoploss_title,visible);
   SetControlVisible(m_section_stoploss_note,visible);
   SetControlVisible(m_card_stoploss_fixo,visible);
   SetControlVisible(m_card_stoploss_calculo,visible);
   SetControlVisible(m_card_stoploss_calculo_media,visible);
   SetControlVisible(m_card_stoploss_calculo_multiplicar,visible);
   SetControlVisible(m_card_stoploss_referencia,visible);
   SetControlVisible(m_label_stoploss_fixo,visible);
   SetControlVisible(m_label_stoploss_calculo,visible);
   SetControlVisible(m_label_stoploss_calculo_media,visible);
   SetControlVisible(m_label_stoploss_calculo_multiplicar,visible);
   SetControlVisible(m_label_stoploss_referencia,visible);
   SetControlVisible(m_radio_stoploss_mode,visible);
   SetControlVisible(m_label_stoploss_calculo_qtd_candle,visible);
   SetControlVisible(m_edit_stoploss_calculo_qtd_candle,visible);
   SetControlVisible(m_label_stoploss_calculo_base_referencia,visible);
   SetControlVisible(m_combo_stoploss_calculo_base_referencia,visible);
   SetControlVisible(m_label_stoploss_calculo_base_multiplicar,visible);
   SetControlVisible(m_combo_stoploss_calculo_base_multiplicar,visible);
   SetControlVisible(m_label_stoploss_referencia_base,visible);
   SetControlVisible(m_combo_stoploss_referencia_base,visible);
   SetControlVisible(m_label_stoploss_referencia_candle,visible);
   SetControlVisible(m_combo_stoploss_referencia_candle,visible);
   SetControlVisible(m_label_stoploss_calculo_multiplicar_candle,visible);
   SetControlVisible(m_edit_stoploss_calculo_multiplicar_candle,visible);
   SetControlVisible(m_label_stoploss_calculo_multiplicar_mult,visible);
   SetControlVisible(m_edit_stoploss_calculo_multiplicar_mult,visible);
   SetControlVisible(m_label_stoploss_distancia,visible);
   SetControlVisible(m_edit_stoploss_distancia,visible);
   SetControlVisible(m_label_usar_stoploss,visible);
   SetControlVisible(m_card_stoploss,visible);
   SetControlVisible(m_radio_stoploss_use,visible);
   SetControlVisible(m_label_tipo_stoploss,visible);
   SetControlVisible(m_combo_tipo_stoploss,visible);
  }

void CConstrutorDialog::AtualizarControlesComConfig(void)
  {
   g_bloquear_sincronizacao = true;

   m_edit_nome.Text(g_config.nome_estrategia);
   m_combo_mercado.SelectByValue((int)g_config.mercado);
   m_combo_operacional.SelectByValue((int)g_config.tipo_operacional);
   m_combo_modo.SelectByValue((int)g_config.modo_processamento);
   SyncRadioGroup(m_radio_compra,g_config.operar_compra ? 1 : 0);
   SyncRadioGroup(m_radio_venda,g_config.operar_venda ? 1 : 0);
   m_combo_horario_inicial_hora.SelectByValue(g_config.horario_inicial_hora);
   m_combo_horario_inicial_min.SelectByValue(g_config.horario_inicial_min);
   m_combo_horario_final_hora.SelectByValue(g_config.horario_final_hora);
   m_combo_horario_final_min.SelectByValue(g_config.horario_final_min);
   SyncRadioGroup(m_radio_zerar_por_horario,g_config.zerar_por_horario ? 1 : 0);
   m_combo_horario_zerar_hora.SelectByValue(g_config.horario_zerar_hora);
   m_combo_horario_zerar_min.SelectByValue(g_config.horario_zerar_min);
   m_combo_tempo_grafico.SelectByValue((int)g_config.tempo_grafico);
   SyncRadioGroup(m_radio_stoploss_mode,
      g_config.stoploss_fixo ? 0 :
      g_config.stoploss_calculo_media ? 1 :
      g_config.stoploss_calculo_multiplicar ? 2 :
      g_config.stoploss_referencia ? 3 : 0);
   m_edit_stoploss_distancia.Text(DoubleToString(g_config.stoploss_distancia,2));
   m_edit_stoploss_calculo_qtd_candle.Text(IntegerToString(g_config.stoploss_calculo_qtd_candle));
   m_edit_stoploss_calculo_multiplicar_candle.Text(IntegerToString(g_config.stoploss_calculo_multiplicar_candle));
   m_edit_stoploss_calculo_multiplicar_mult.Text(FormatarDecimalCurto(g_config.stoploss_calculo_multiplicar_mult));
   m_combo_stoploss_referencia_base.SelectByValue(g_config.stoploss_referencia_base);
   m_combo_stoploss_referencia_candle.SelectByValue(g_config.stoploss_referencia_candle);
   m_edit_volume_inicial.Text(DoubleToString(g_config.volume_inicial,2));
   m_edit_spread_maximo.Text(IntegerToString(g_config.spread_maximo));
   SyncRadioGroup(m_radio_stoploss_use,g_config.usar_stop_loss ? 1 : 0);
   m_combo_stoploss_calculo_base_referencia.SelectByValue(g_config.stoploss_calculo_base_referencia);
   m_combo_stoploss_calculo_base_multiplicar.SelectByValue(g_config.stoploss_calculo_base_multiplicar);
   m_combo_tipo_stoploss.SelectByValue((int)g_config.tipo_calculo_stoploss);
   AtualizarEstadoZeragemHorario();
   AtualizarEstadoStoploss();

   g_bloquear_sincronizacao = false;
   ChartRedraw(m_chart_id);
  }

void CConstrutorDialog::AtualizarConfigComControles(const bool marcar_reexecucao)
  {
   if(g_bloquear_sincronizacao)
      return;

   SConfiguracaoPainel anterior = g_config;

   g_config.nome_estrategia    = TextoLimpo(m_edit_nome.Text());
   g_config.mercado              = (ENUM_CONSTRUTOR_MERCADO)LimitarInteiro((int)m_combo_mercado.Value(),0,1);
   g_config.tipo_operacional     = (ENUM_CONSTRUTOR_TIPO_OPERACIONAL)LimitarInteiro((int)m_combo_operacional.Value(),0,1);
   g_config.modo_processamento   = (ENUM_CONSTRUTOR_PROCESSAMENTO)LimitarInteiro((int)m_combo_modo.Value(),0,1);
   g_config.operar_compra        = (m_radio_compra.Value() != 0);
   g_config.operar_venda         = (m_radio_venda.Value() != 0);
   g_config.horario_inicial_hora = LimitarInteiro((int)m_combo_horario_inicial_hora.Value(),0,23);
   g_config.horario_inicial_min  = LimitarInteiro((int)m_combo_horario_inicial_min.Value(),0,59);
   g_config.horario_final_hora   = LimitarInteiro((int)m_combo_horario_final_hora.Value(),0,23);
   g_config.horario_final_min    = LimitarInteiro((int)m_combo_horario_final_min.Value(),0,59);
   g_config.zerar_por_horario    = (m_radio_zerar_por_horario.Value() != 0);
   g_config.horario_zerar_hora   = LimitarInteiro((int)m_combo_horario_zerar_hora.Value(),0,23);
   g_config.horario_zerar_min    = LimitarInteiro((int)m_combo_horario_zerar_min.Value(),0,59);
   g_config.tempo_grafico        = (ENUM_TEMPO_GRAFICO)LimitarInteiro((int)m_combo_tempo_grafico.Value(),0,20);
   const int stoploss_mode = LimitarInteiro((int)m_radio_stoploss_mode.Value(),0,3);
   g_config.stoploss_fixo        = (stoploss_mode == 0);
   g_config.stoploss_calculo_media = (stoploss_mode == 1);
   g_config.stoploss_calculo_multiplicar = (stoploss_mode == 2);
   g_config.stoploss_referencia  = (stoploss_mode == 3);
   g_config.stoploss_calculo_qtd_candle = LimitarInteiro((int)StringToInteger(TextoLimpo(m_edit_stoploss_calculo_qtd_candle.Text())),1,999);
   g_config.stoploss_calculo_base_referencia = (int)LimitarInteiro((int)m_combo_stoploss_calculo_base_referencia.Value(),0,3);
   g_config.stoploss_calculo_base_multiplicar = (int)LimitarInteiro((int)m_combo_stoploss_calculo_base_multiplicar.Value(),0,1);
   g_config.stoploss_calculo_multiplicar_candle = LimitarInteiro((int)StringToInteger(TextoLimpo(m_edit_stoploss_calculo_multiplicar_candle.Text())),1,999);
   string multiplicar_mult_texto = TextoLimpo(m_edit_stoploss_calculo_multiplicar_mult.Text());
   StringReplace(multiplicar_mult_texto,",",".");
   g_config.stoploss_calculo_multiplicar_mult = StringToDouble(multiplicar_mult_texto);
   g_config.stoploss_referencia_base = (int)LimitarInteiro((int)m_combo_stoploss_referencia_base.Value(),0,3);
   g_config.stoploss_referencia_candle = (int)LimitarInteiro((int)m_combo_stoploss_referencia_candle.Value(),0,5);
   string stoploss_texto         = TextoLimpo(m_edit_stoploss_distancia.Text());
   StringReplace(stoploss_texto,",",".");
   g_config.stoploss_distancia   = StringToDouble(stoploss_texto);
   string volume_texto           = TextoLimpo(m_edit_volume_inicial.Text());
   StringReplace(volume_texto,",",".");
   g_config.volume_inicial       = StringToDouble(volume_texto);
   g_config.spread_maximo        = (int)StringToInteger(TextoLimpo(m_edit_spread_maximo.Text()));
   g_config.usar_stop_loss       = (m_radio_stoploss_use.Value() != 0);
   g_config.tipo_calculo_stoploss = (ENUM_TIPO_CALCULO_DISTANCIAS)LimitarInteiro((int)m_combo_tipo_stoploss.Value(),0,1);

   const bool alterou =
      (g_config.nome_estrategia != anterior.nome_estrategia) ||
      (g_config.mercado != anterior.mercado) ||
      (g_config.tipo_operacional != anterior.tipo_operacional) ||
      (g_config.modo_processamento != anterior.modo_processamento) ||
      (g_config.operar_compra != anterior.operar_compra) ||
      (g_config.operar_venda != anterior.operar_venda) ||
      (g_config.horario_inicial_hora != anterior.horario_inicial_hora) ||
      (g_config.horario_inicial_min != anterior.horario_inicial_min) ||
      (g_config.horario_final_hora != anterior.horario_final_hora) ||
      (g_config.horario_final_min != anterior.horario_final_min) ||
      (g_config.zerar_por_horario != anterior.zerar_por_horario) ||
      (g_config.horario_zerar_hora != anterior.horario_zerar_hora) ||
      (g_config.horario_zerar_min != anterior.horario_zerar_min) ||
      (g_config.tempo_grafico != anterior.tempo_grafico) ||
      (g_config.stoploss_fixo != anterior.stoploss_fixo) ||
      (g_config.stoploss_calculo_media != anterior.stoploss_calculo_media) ||
      (g_config.stoploss_calculo_multiplicar != anterior.stoploss_calculo_multiplicar) ||
      (g_config.stoploss_calculo_qtd_candle != anterior.stoploss_calculo_qtd_candle) ||
      (g_config.stoploss_calculo_base_referencia != anterior.stoploss_calculo_base_referencia) ||
      (g_config.stoploss_calculo_base_multiplicar != anterior.stoploss_calculo_base_multiplicar) ||
      (g_config.stoploss_calculo_multiplicar_candle != anterior.stoploss_calculo_multiplicar_candle) ||
      (g_config.stoploss_calculo_multiplicar_mult != anterior.stoploss_calculo_multiplicar_mult) ||
      (g_config.stoploss_referencia_base != anterior.stoploss_referencia_base) ||
      (g_config.stoploss_referencia_candle != anterior.stoploss_referencia_candle) ||
      (g_config.stoploss_referencia != anterior.stoploss_referencia) ||
      (g_config.stoploss_distancia != anterior.stoploss_distancia) ||
      (g_config.volume_inicial != anterior.volume_inicial) ||
      (g_config.spread_maximo != anterior.spread_maximo) ||
      (g_config.usar_stop_loss != anterior.usar_stop_loss) ||
      (g_config.tipo_calculo_stoploss != anterior.tipo_calculo_stoploss);

   AtualizarEstadoZeragemHorario();
   AtualizarEstadoStoploss();

   if(alterou && marcar_reexecucao)
     {
      g_execucao_habilitada = false;
      AtualizarStatus("Configuracao alterada. Clique em Executar novamente.",COLOR_ACCENT);
     AtualizarBotaoExecucao();
     }

   ChartRedraw(m_chart_id);
  }

void CConstrutorDialog::AtualizarEstadoZeragemHorario(void)
  {
   const bool habilitar = g_config.zerar_por_horario;

   SetControlEnabled(m_combo_horario_zerar_hora,habilitar);
   SetControlEnabled(m_combo_horario_zerar_min,habilitar);
   m_label_horario_zerar_hora.Color(habilitar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_horario_zerar_min.Color(habilitar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
  }

void CConstrutorDialog::AtualizarEstadoStoploss(void)
  {
   const bool habilitar = (m_radio_stoploss_use.Value() != 0);
   const int modo = LimitarInteiro((int)m_radio_stoploss_mode.Value(),0,3);
   const bool habilitar_fixo = habilitar && (modo == 0);
   const bool habilitar_media = habilitar && (modo == 1);
   const bool habilitar_multiplicar = habilitar && (modo == 2);
   const bool habilitar_referencia = habilitar && (modo == 3);
   SetControlEnabled(m_edit_stoploss_distancia,habilitar_fixo);
   SetControlEnabled(m_edit_stoploss_calculo_qtd_candle,habilitar_media);
   SetControlEnabled(m_combo_stoploss_calculo_base_referencia,habilitar_media);
   SetControlEnabled(m_combo_stoploss_calculo_base_multiplicar,habilitar_multiplicar);
   SetControlEnabled(m_edit_stoploss_calculo_multiplicar_candle,habilitar_multiplicar);
   SetControlEnabled(m_edit_stoploss_calculo_multiplicar_mult,habilitar_multiplicar);
   SetControlEnabled(m_combo_stoploss_referencia_base,habilitar_referencia);
   SetControlEnabled(m_combo_stoploss_referencia_candle,habilitar_referencia);
   SetControlEnabled(m_combo_tipo_stoploss,habilitar);

   m_label_stoploss_fixo.Color(habilitar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo.Color(habilitar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_media.Color(habilitar_media ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_multiplicar.Color(habilitar_multiplicar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_referencia.Color(habilitar_referencia ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_distancia.Color(habilitar_fixo ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_qtd_candle.Color(habilitar_media ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_base_referencia.Color(habilitar_media ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_base_multiplicar.Color(habilitar_multiplicar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_multiplicar_candle.Color(habilitar_multiplicar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_calculo_multiplicar_mult.Color(habilitar_multiplicar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_referencia_base.Color(habilitar_referencia ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_stoploss_referencia_candle.Color(habilitar_referencia ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
   m_label_tipo_stoploss.Color(habilitar ? COLOR_TEXT_DARK : COLOR_TEXT_MUTED);
  }

void CConstrutorDialog::AtualizarStatus(const string texto,const color texto_cor)
  {
   m_status_label.Text(texto);
   m_status_label.Color(texto_cor);
   ChartRedraw(m_chart_id);
  }

void CConstrutorDialog::AtualizarBotaoExecucao(void)
  {
   if(g_execucao_habilitada)
     {
      m_button_execute.Text("Executando");
      m_button_execute.ColorBackground(COLOR_SUCCESS);
      m_button_execute.ColorBorder(C'141,210,176');
     }
   else
     {
      m_button_execute.Text("Executar");
      m_button_execute.ColorBackground(COLOR_ACCENT);
      m_button_execute.ColorBorder(C'255,213,148');
     }
  }

void CConstrutorDialog::SelectTab(const int index)
  {
   if(index < 0 || index >= TAB_COUNT)
      return;

   m_active_tab = index;

   for(int i = 0; i < TAB_COUNT; i++)
     {
      CButton *button = TabButtonByIndex(i);
      if(button == NULL)
         continue;

      StyleTabButton(*button,(i == index));
     }

   m_content_tag.Text(StringFormat("ABA %02d",index + 1));
   m_content_title.Text(g_tab_names[index] + " - " + g_tab_roles[index]);
   m_content_summary.Text(g_tab_summaries[index]);
   m_content_line_1.Text(g_tab_notes[index]);
   m_content_line_2.Text("- Area vazia para reconstruir os controles desta aba.");
   m_content_line_3.Text("- O layout atual serve apenas como base visual e navegacao.");
   SetTab1ControlsVisible(index == 0);
   ChartRedraw(m_chart_id);
   return;

   if(index == 0)
     {
      m_content_line_2.Text("- Alterou o painel? clique em Executar novamente por seguranca.");
      m_content_line_3.Text("- Alterou os inputs e confirmou? o painel recarrega no reinicio do EA.");
      SetTab1ControlsVisible(true);
      SetTab2ControlsVisible(false);
      SetTab3ControlsVisible(false);
      SetTab4ControlsVisible(false);
     }
   else if(index == 1)
     {
      m_content_line_2.Text("- Se zerar por horario estiver em Sim, os campos de encerramento ficam ativos.");
      m_content_line_3.Text("- Inicio e fim aceitam janela normal ou virada de dia, como no EaMin.");
      SetTab1ControlsVisible(false);
      SetTab2ControlsVisible(true);
      SetTab3ControlsVisible(false);
      SetTab4ControlsVisible(false);
      AtualizarEstadoZeragemHorario();
     }
   else if(index == 2)
     {
      m_content_line_2.Text("- Tempo grafico define o timeframe usado na leitura inicial.");
      m_content_line_3.Text("- Volume inicial e spread maximo seguem a base do EaMin.");
      SetTab1ControlsVisible(false);
      SetTab2ControlsVisible(false);
      SetTab3ControlsVisible(true);
      SetTab4ControlsVisible(false);
     }
   else if(index == 3)
     {
      m_content_line_2.Text("- Sim mantem o SL inicial e libera break-even/trailing.");
      m_content_line_3.Text("- Escolha pontos ou percentual sem desperdiçar espaço.");
      SetTab1ControlsVisible(false);
      SetTab2ControlsVisible(false);
      SetTab3ControlsVisible(false);
      SetTab4ControlsVisible(true);
     }
   else
     {
      m_content_line_2.Text("- Esta aba ainda esta reservada para a proxima etapa do construtor.");
      m_content_line_3.Text("- O botao Executar continua validando os dados obrigatorios da aba 1.");
      SetTab1ControlsVisible(false);
      SetTab2ControlsVisible(false);
      SetTab3ControlsVisible(false);
      SetTab4ControlsVisible(false);
     }

   ChartRedraw(m_chart_id);
  }

void CConstrutorDialog::OnClickTab1(void)  { SelectTab(0); }
void CConstrutorDialog::OnClickTab2(void)  { SelectTab(1); }
void CConstrutorDialog::OnClickTab3(void)  { SelectTab(2); }
void CConstrutorDialog::OnClickTab4(void)  { SelectTab(3); }
void CConstrutorDialog::OnClickTab5(void)  { SelectTab(4); }
void CConstrutorDialog::OnClickTab6(void)  { SelectTab(5); }
void CConstrutorDialog::OnClickTab7(void)  { SelectTab(6); }
void CConstrutorDialog::OnClickTab8(void)  { SelectTab(7); }
void CConstrutorDialog::OnClickTab9(void)  { SelectTab(8); }
void CConstrutorDialog::OnClickTab10(void) { SelectTab(9); }
void CConstrutorDialog::OnClickTab11(void) { SelectTab(10); }

void CConstrutorDialog::OnEndEditNome(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeMercado(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeTipoOperacional(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeModo(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeCompra(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeVenda(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeHorarioInicialHora(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeHorarioInicialMin(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeHorarioFinalHora(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeHorarioFinalMin(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeZerarPorHorario(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeHorarioZerarHora(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeHorarioZerarMin(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeTempoGrafico(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnEndEditVolumeInicial(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnEndEditSpreadMaximo(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnEndEditStoplossCalculoQtdCandle(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnEndEditStoplossCalculoMultiplicarCandle(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnEndEditStoplossCalculoMultiplicarMult(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeStoplossCalculoBaseReferencia(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeStoplossReferenciaBase(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeStoplossReferenciaCandle(void)
  {
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeStoplossUse(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeStoplossMode(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnChangeTipoStoploss(void)
  {
   if(g_bloquear_sincronizacao)
      return;
   AtualizarConfigComControles(true);
  }

void CConstrutorDialog::OnClickExecutar(void)
  {
   AtualizarConfigComControles(false);

   string mensagem = "";
   if(!ValidarConfiguracao(mensagem))
     {
      g_execucao_habilitada = false;
      AtualizarBotaoExecucao();
      AtualizarStatus(mensagem,COLOR_ERROR);
      return;
     }

   g_execucao_habilitada = true;
   AtualizarBotaoExecucao();
   AtualizarStatus("Execucao liberada para " + g_config.nome_estrategia + ".",COLOR_SUCCESS);
   Visible(true);
   ChartRedraw(m_chart_id);
  }

void CConstrutorDialog::OnClickButtonClose(void)
  {
   ExpertRemove();
  }

int OnInit()
  {
   CarregarConfiguracaoDosInputs();

   if(!ExtDialog.Create(0,"ConstrutorUI",0,30,30,1200,680))
     {
      PrintFormat("Construtor: ExtDialog.Create falhou. err=%d",GetLastError());
      return(INIT_FAILED);
     }

   if(!ExtDialog.Run())
      PrintFormat("Construtor: ExtDialog.Run retornou falso. err=%d",GetLastError());
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {
   ExtDialog.Destroy(reason);
  }

void OnTick()
  {
   return;
  }

void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   ExtDialog.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
