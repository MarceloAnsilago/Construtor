//+------------------------------------------------------------------+
//|                                           ConstrutorDialog.mqh   |
//|                       Base inicial da interface do Construtor    |
//+------------------------------------------------------------------+
#ifndef __CONSTRUTOR_DIALOG_MQH__
#define __CONSTRUTOR_DIALOG_MQH__

#include <Controls\Dialog.mqh>
#include <Controls\Panel.mqh>
#include <Controls\Button.mqh>
#include <Controls\Label.mqh>
#include <Controls\Edit.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\CheckBox.mqh>
#include <Controls\RadioGroup.mqh>
#include <Controls\SpinEdit.mqh>

enum ENUM_CONSTRUTOR_MERCADO
  {
   CONSTRUTOR_MERCADO_B3=0,
   CONSTRUTOR_MERCADO_FOREX=1
  };

enum ENUM_CONSTRUTOR_TIPO_OPERACIONAL
  {
   CONSTRUTOR_TIPO_DAY_TRADE=0,
   CONSTRUTOR_TIPO_SWING_TRADE=1
  };

enum ENUM_CONSTRUTOR_MODO_PROCESSAMENTO
  {
   CONSTRUTOR_MODO_CADA_TICK=0,
   CONSTRUTOR_MODO_CADA_SEGUNDO=1
  };

enum ENUM_CONSTRUTOR_TEMPO_GRAFICO
  {
   CONSTRUTOR_CORRENTE=0,
   CONSTRUTOR_M1=1,
   CONSTRUTOR_M2=2,
   CONSTRUTOR_M3=3,
   CONSTRUTOR_M4=4,
   CONSTRUTOR_M5=5,
   CONSTRUTOR_M6=6,
   CONSTRUTOR_M10=7,
   CONSTRUTOR_M12=8,
   CONSTRUTOR_M15=9,
   CONSTRUTOR_M30=10,
   CONSTRUTOR_H1=11,
   CONSTRUTOR_H2=12,
   CONSTRUTOR_H3=13,
   CONSTRUTOR_H4=14,
   CONSTRUTOR_H6=15,
   CONSTRUTOR_H8=16,
   CONSTRUTOR_H12=17,
   CONSTRUTOR_D1=18,
   CONSTRUTOR_W1=19,
   CONSTRUTOR_MN1=20
  };

enum ENUM_CONSTRUTOR_SIM_NAO
  {
   CONSTRUTOR_NAO=0,
   CONSTRUTOR_SIM=1
  };

enum ENUM_CONSTRUTOR_TIPO_STOP_LOSS
  {
   CONSTRUTOR_STOP_PONTOS=0,
   CONSTRUTOR_STOP_PERCENTUAL=1
  };

enum ENUM_CONSTRUTOR_BASE_MEDIA
  {
   CONSTRUTOR_MEDIA_MAXIMA=0,
   CONSTRUTOR_MEDIA_MINIMA=1,
   CONSTRUTOR_MEDIA_ABERTURA=2,
   CONSTRUTOR_MEDIA_FECHAMENTO=3
  };

enum ENUM_CONSTRUTOR_BASE_MULTIPLICAR
  {
   CONSTRUTOR_MULTIPLICAR_CORPO=0,
   CONSTRUTOR_MULTIPLICAR_PAVIOS=1
  };

enum ENUM_CONSTRUTOR_POSICAO_REFERENCIA
  {
   CONSTRUTOR_POSICAO_ATUAL=0,
   CONSTRUTOR_POSICAO_ULTIMO=1,
   CONSTRUTOR_POSICAO_PENULTIMO=2,
   CONSTRUTOR_POSICAO_ANTIPENULTIMO=3
  };

enum ENUM_CONSTRUTOR_STOP_MOVEL_INDICADOR
  {
   CONSTRUTOR_STOP_IND_ATR=0,
   CONSTRUTOR_STOP_IND_MEDIA_MOVEL=1,
   CONSTRUTOR_STOP_IND_PARABOLIC_SAR=2,
   CONSTRUTOR_STOP_IND_BOLLINGER=3,
   CONSTRUTOR_STOP_IND_ENVELOPES=4
  };

enum ENUM_CONSTRUTOR_STOP_MOVEL_MODO
  {
   CONSTRUTOR_STOP_MOVEL_PADRAO=0,
   CONSTRUTOR_STOP_MOVEL_CANDLES=1,
   CONSTRUTOR_STOP_MOVEL_INDICADOR=2
  };

enum ENUM_CONSTRUTOR_STOP_MOVEL_CANDLES_MODO
  {
   CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA=0,
   CONSTRUTOR_STOP_MOVEL_CANDLES_NUM_CANDLES=1
  };

struct SConstrutorSettings
  {
   string                          estrategia_nome;
   ENUM_CONSTRUTOR_MERCADO         mercado;
   ENUM_CONSTRUTOR_TIPO_OPERACIONAL tipo_operacional;
   ENUM_CONSTRUTOR_MODO_PROCESSAMENTO modo_processamento;
   ENUM_CONSTRUTOR_SIM_NAO         operar_compra;
   ENUM_CONSTRUTOR_SIM_NAO         operar_venda;
   int                             inicio_hora;
   int                             inicio_minuto;
   int                             fim_hora;
   int                             fim_minuto;
   ENUM_CONSTRUTOR_SIM_NAO         zerar_posicoes;
   string                          horario_zeragem;
   ENUM_CONSTRUTOR_TEMPO_GRAFICO   tempo_grafico;
   double                          volume_inicial;
   int                             spread_maximo;
   ENUM_CONSTRUTOR_SIM_NAO         usar_stop_loss;
   ENUM_CONSTRUTOR_TIPO_STOP_LOSS  tipo_stop_loss;
   ENUM_CONSTRUTOR_SIM_NAO         stop_fixo;
   ENUM_CONSTRUTOR_SIM_NAO         stop_calculo;
   ENUM_CONSTRUTOR_SIM_NAO         stop_calculo_media;
   ENUM_CONSTRUTOR_SIM_NAO         stop_calculo_multiplicar;
   ENUM_CONSTRUTOR_SIM_NAO         stop_calculo_referencia;
   ENUM_CONSTRUTOR_SIM_NAO         stop_movel;
   ENUM_CONSTRUTOR_TIPO_STOP_LOSS  tipo_stop_movel;
   ENUM_CONSTRUTOR_STOP_MOVEL_MODO stop_movel_modo;
   ENUM_CONSTRUTOR_STOP_MOVEL_CANDLES_MODO stop_movel_candles_modo;
   int                             stop_movel_padrao_adicionar_favor;
   int                             stop_movel_padrao_passo;
   double                          stop_movel_candles_distancia;
   ENUM_CONSTRUTOR_BASE_MEDIA      stop_movel_candles_posicao;
   int                             stop_movel_candles_count;
   ENUM_CONSTRUTOR_BASE_MEDIA      stop_movel_candles_count_posicao;
   ENUM_CONSTRUTOR_STOP_MOVEL_INDICADOR stop_movel_indicador;
   ENUM_CONSTRUTOR_SIM_NAO         trailing_stop;
   ENUM_CONSTRUTOR_TIPO_STOP_LOSS  tipo_trailing_stop;
   ENUM_CONSTRUTOR_STOP_MOVEL_MODO trailing_stop_modo;
   ENUM_CONSTRUTOR_STOP_MOVEL_CANDLES_MODO trailing_stop_candles_modo;
   int                             trailing_stop_padrao_adicionar_favor;
   int                             trailing_stop_padrao_passo;
   double                          trailing_stop_candles_distancia;
   ENUM_CONSTRUTOR_BASE_MEDIA      trailing_stop_candles_posicao;
   int                             trailing_stop_candles_count;
   ENUM_CONSTRUTOR_BASE_MEDIA      trailing_stop_candles_count_posicao;
   ENUM_CONSTRUTOR_STOP_MOVEL_INDICADOR trailing_stop_indicador;
   ENUM_CONSTRUTOR_SIM_NAO         saida_parcial;
   ENUM_CONSTRUTOR_TIPO_STOP_LOSS  tipo_saida_parcial;
   double                          saida_parcial_valor[6];
   double                          saida_parcial_distancia[6];
   int                             stop_calculo_media_qtd_candles;
   ENUM_CONSTRUTOR_BASE_MEDIA      stop_calculo_media_base;
   ENUM_CONSTRUTOR_BASE_MULTIPLICAR stop_calculo_multiplicar_base;
   int                             stop_calculo_multiplicar_candle;
   double                          stop_calculo_multiplicar_qtd;
   ENUM_CONSTRUTOR_BASE_MEDIA      stop_calculo_referencia_base;
   ENUM_CONSTRUTOR_POSICAO_REFERENCIA stop_calculo_referencia_posicao;
   double                          stop_fixo_distancia;
   ENUM_CONSTRUTOR_SIM_NAO         take_profit;
   ENUM_CONSTRUTOR_TIPO_STOP_LOSS  tipo_take_profit;
   ENUM_CONSTRUTOR_SIM_NAO         take_fixo;
   ENUM_CONSTRUTOR_SIM_NAO         take_calculo;
   ENUM_CONSTRUTOR_SIM_NAO         take_calculo_media;
   ENUM_CONSTRUTOR_SIM_NAO         take_calculo_multiplicar;
   ENUM_CONSTRUTOR_SIM_NAO         take_calculo_referencia;
   int                             take_calculo_media_qtd_candles;
   ENUM_CONSTRUTOR_BASE_MEDIA      take_calculo_media_base;
   ENUM_CONSTRUTOR_BASE_MULTIPLICAR take_calculo_multiplicar_base;
   int                             take_calculo_multiplicar_candle;
   double                          take_calculo_multiplicar_qtd;
   ENUM_CONSTRUTOR_BASE_MEDIA      take_calculo_referencia_base;
   ENUM_CONSTRUTOR_POSICAO_REFERENCIA take_calculo_referencia_posicao;
   double                          take_fixo_distancia;
  };

extern SConstrutorSettings g_settings;

#include "UI\\Painel.mqh"

class CConstrutorDialog : public CAppDialog
  {
private:
   enum
     {
      TAB_COUNT=11
     };

   CPanel            m_sidebar;
   CPanel            m_content;
   CButton           m_tabs[TAB_COUNT];
   CLabel            m_page_title;
   CLabel            m_page_note;
   CButton           m_execute_button;
   CPainel           m_painel;
   int               m_active_tab;
   string            m_tab_titles[TAB_COUNT];
   string            m_tab_notes[TAB_COUNT];
   SConstrutorSettings m_settings;
   bool              m_settings_bound;

public:
                     CConstrutorDialog(void);
   virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
   virtual void      Destroy(const int reason=REASON_PROGRAM);
   virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
   void              BindSettings(const SConstrutorSettings &settings);

private:
   void              InitTabData(void);
   bool              CreateLayout(void);
   bool              CreateSidebar(void);
   bool              CreateContent(void);
   bool              CreateTabs(void);
   bool              CreateExecuteButton(void);
   void              SelectTab(const int index);
   void              UpdateTabVisuals(void);
   void              LoadSettingsToControls(void);
   void              StoreControlsToSettings(void);
   bool              OnTabClick(const int index);
   bool              OnExecuteClick(void);
   bool              OnTab4FixedChange(void);
   bool              OnTab4CalcChange(void);
   bool              OnTab4CalcModeOuterChange(void);
   bool              OnTab4CalcRefOuterChange(void);
   bool              OnTab4CalcModeChange(void);
   bool              OnTab4CalcRefChange(void);
   bool              OnTab5PadraoChange(void);
   bool              OnTab5CandlesChange(void);
   bool              OnTab5CandlesDistanceChange(void);
   bool              OnTab5CandlesCountChange(void);
   bool              OnTab5IndicadorChange(void);
   bool              OnTab6FixedChange(void);
   bool              OnTab6CalcChange(void);
   bool              OnTab6CalcModeOuterChange(void);
   bool              OnTab6CalcRefOuterChange(void);
   bool              OnTab6CalcModeChange(void);
   bool              OnTab6CalcRefChange(void);
   bool              OnTab7PadraoChange(void);
   bool              OnTab7CandlesChange(void);
   bool              OnTab7CandlesDistanceChange(void);
   bool              OnTab7CandlesCountChange(void);
   bool              OnTab7IndicadorChange(void);
  };

EVENT_MAP_BEGIN(CConstrutorDialog)
   ON_EVENT(ON_CLICK,m_execute_button,OnExecuteClick)
   ON_INDEXED_EVENT(ON_CLICK,m_tabs,OnTabClick)
   ON_EVENT(ON_CHANGE,m_painel.m_tab4.m_tab4_card_fixed_check,OnTab4FixedChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab4.m_tab4_card_calc_check,OnTab4CalcChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab4.m_tab4_card_calc_mode_outer_check,OnTab4CalcModeOuterChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab4.m_tab4_card_calc_ref_outer_check,OnTab4CalcRefOuterChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab4.m_tab4_card_calc_mode_check,OnTab4CalcModeChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab4.m_tab4_card_calc_ref_check,OnTab4CalcRefChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab5.m_tab5_card_padrao_check,OnTab5PadraoChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab5.m_tab5_card_candles_check,OnTab5CandlesChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab5.m_tab5_card_candles_distance_check,OnTab5CandlesDistanceChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab5.m_tab5_card_candles_count_check,OnTab5CandlesCountChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab5.m_tab5_card_indicador_check,OnTab5IndicadorChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab6.m_tab6_card_fixed_check,OnTab6FixedChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab6.m_tab6_card_calc_check,OnTab6CalcChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab6.m_tab6_card_calc_mode_outer_check,OnTab6CalcModeOuterChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab6.m_tab6_card_calc_ref_outer_check,OnTab6CalcRefOuterChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab6.m_tab6_card_calc_mode_check,OnTab6CalcModeChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab6.m_tab6_card_calc_ref_check,OnTab6CalcRefChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab7.m_tab7_card_padrao_check,OnTab7PadraoChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab7.m_tab7_card_candles_check,OnTab7CandlesChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab7.m_tab7_card_candles_distance_check,OnTab7CandlesDistanceChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab7.m_tab7_card_candles_count_check,OnTab7CandlesCountChange)
   ON_EVENT(ON_CHANGE,m_painel.m_tab7.m_tab7_card_indicador_check,OnTab7IndicadorChange)
EVENT_MAP_END(CAppDialog)

CConstrutorDialog::CConstrutorDialog(void) : m_active_tab(0), m_settings_bound(false)
  {
   InitTabData();
  }

void CConstrutorDialog::BindSettings(const SConstrutorSettings &settings)
  {
   m_settings=settings;
   m_settings_bound=true;
  }

void CConstrutorDialog::InitTabData(void)
  {
   m_tab_titles[0]="1. Inf. Iniciais";
   m_tab_titles[1]="2. Horario";
   m_tab_titles[2]="3. Conf. inicial";
   m_tab_titles[3]="4. Stop loss";
   m_tab_titles[4]="5. Stop movel";
   m_tab_titles[5]="6. Take profit";
   m_tab_titles[6]="7. Trailing stop";
   m_tab_titles[7]="8. Saidas parciais";
   m_tab_titles[8]="9. Sinais";
   m_tab_titles[9]="10. Ajustes finais";
   m_tab_titles[10]="11. Painel";

   m_tab_notes[0]="Base inicial do projeto e configuracao principal.";
   m_tab_notes[1]="Horarios de operacao e zeragem automatica.";
   m_tab_notes[2]="Tempo grafico, volume inicial e spread maximo.";
   m_tab_notes[3]="Stop loss fixo, calculo e protecao por perda.";
   m_tab_notes[4]="Regras para mover o stop automaticamente.";
   m_tab_notes[5]="Take profit fixo, calculo e projecao de lucro.";
   m_tab_notes[6]="Trailing stop e acompanhamento dinamico.";
   m_tab_notes[7]="Saidas fracionadas e gerenciamento parcial.";
   m_tab_notes[8]="Gatilhos e filtros de sinal.";
   m_tab_notes[9]="Acabamento final da estrategia.";
   m_tab_notes[10]="Painel geral da interface.";
  }

bool CConstrutorDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
   if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
      return(false);

   Caption("Construtor Visual | Arraste pelo topo");

   if(!CreateLayout())
      return(false);

   SelectTab(0);
   return(true);
  }

void CConstrutorDialog::Destroy(const int reason)
  {
   CAppDialog::Destroy(reason);
   m_active_tab=0;
  }

bool CConstrutorDialog::CreateLayout(void)
  {
   if(!CreateSidebar())
      return(false);
   if(!CreateContent())
      return(false);
   if(!CreateTabs())
      return(false);
   if(!m_painel.Create(*this,m_chart_id,m_subwin))
      return(false);
   if(!CreateExecuteButton())
      return(false);
   LoadSettingsToControls();
   return(true);
  }

bool CConstrutorDialog::CreateSidebar(void)
  {
   const int x1=10;
   const int y1=10;
   const int x2=224;
   const int y2=586;

   if(!m_sidebar.Create(m_chart_id,"ConstrutorSidebar",m_subwin,x1,y1,x2,y2))
      return(false);
   m_sidebar.ColorBackground(C'27,38,59');
   m_sidebar.ColorBorder(C'18,29,43');
   m_sidebar.BorderType(BORDER_FLAT);
   if(!Add(m_sidebar))
      return(false);
   return(true);
  }

bool CConstrutorDialog::CreateContent(void)
  {
   const int x1=236;
   const int y1=10;
   const int x2=992;
   const int y2=586;

   if(!m_content.Create(m_chart_id,"ConstrutorContent",m_subwin,x1,y1,x2,y2))
      return(false);
   m_content.ColorBackground(C'247,241,231');
   m_content.ColorBorder(C'220,207,186');
   m_content.BorderType(BORDER_FLAT);
   if(!Add(m_content))
      return(false);

   if(!m_page_title.Create(m_chart_id,"ConstrutorPageTitle",m_subwin,260,32,0,0))
      return(false);
   m_page_title.FontSize(18);
   m_page_title.Color(C'43,43,43');
   if(!Add(m_page_title))
      return(false);

   if(!m_page_note.Create(m_chart_id,"ConstrutorPageNote",m_subwin,260,64,0,0))
      return(false);
   m_page_note.FontSize(10);
   m_page_note.Color(C'91,78,64');
   if(!Add(m_page_note))
      return(false);

   return(true);
  }

bool CConstrutorDialog::CreateTabs(void)
  {
   const int x1=24;
   const int x2=198;
   const int button_height=26;
   const int first_y=90;
   const int gap_y=6;

   for(int i=0; i<TAB_COUNT; i++)
     {
      int y1=first_y+i*(button_height+gap_y);
      int y2=y1+button_height;
      string name="ConstrutorTab_"+(string)(i+1);

      if(!m_tabs[i].Create(m_chart_id,name,m_subwin,x1,y1,x2,y2))
         return(false);

      m_tabs[i].Text(m_tab_titles[i]);
      m_tabs[i].FontSize(10);
      if(!Add(m_tabs[i]))
         return(false);
     }
   return(true);
  }

bool CConstrutorDialog::CreateExecuteButton(void)
  {
   if(!m_execute_button.Create(m_chart_id,"ConstrutorExecuteButton",m_subwin,816,610,964,636))
      return(false);
   m_execute_button.Text("Executar");
   m_execute_button.FontSize(11);
   m_execute_button.Color(clrWhite);
   m_execute_button.ColorBackground(C'226,114,64');
   m_execute_button.ColorBorder(C'240,140,86');
   m_execute_button.Locking(false);
   if(!Add(m_execute_button))
      return(false);
   return(true);
  }

void CConstrutorDialog::SelectTab(const int index)
  {
   if(index<0 || index>=TAB_COUNT)
      return;

   m_active_tab=index;
   m_page_title.Text(m_tab_titles[m_active_tab]);
   m_page_note.Text(m_tab_notes[m_active_tab]);
   m_painel.ShowTab(index);
   UpdateTabVisuals();
   ChartRedraw();
  }

void CConstrutorDialog::LoadSettingsToControls(void)
  {
   if(!m_settings_bound)
      return;

   m_painel.LoadSettingsToControls(m_settings);
  }

void CConstrutorDialog::StoreControlsToSettings(void)
  {
   if(!m_settings_bound)
      return;

   m_painel.StoreControlsToSettings(m_settings);
  }

void CConstrutorDialog::UpdateTabVisuals(void)
  {
   for(int i=0; i<TAB_COUNT; i++)
     {
      const bool selected=(i==m_active_tab);
      m_tabs[i].Pressed(selected);
      m_tabs[i].Color(clrWhite);
      m_tabs[i].ColorBackground(selected ? C'226,114,64' : C'39,54,78');
      m_tabs[i].ColorBorder(selected ? C'240,140,86' : C'62,79,101');
     }
  }

bool CConstrutorDialog::OnTabClick(const int index)
  {
   SelectTab(index);
   return(true);
  }

bool CConstrutorDialog::OnExecuteClick(void)
  {
   StoreControlsToSettings();
   if(m_settings_bound)
     {
      g_settings=m_settings;
      Print("Construtor: configuracao aplicada pelo painel");
     }
   return(true);
  }

bool CConstrutorDialog::OnTab4FixedChange(void) { return(m_painel.m_tab4.OnTab4FixedChange()); }
bool CConstrutorDialog::OnTab4CalcChange(void) { return(m_painel.m_tab4.OnTab4CalcChange()); }
bool CConstrutorDialog::OnTab4CalcModeOuterChange(void) { return(m_painel.m_tab4.OnTab4CalcModeOuterChange()); }
bool CConstrutorDialog::OnTab4CalcRefOuterChange(void) { return(m_painel.m_tab4.OnTab4CalcRefOuterChange()); }
bool CConstrutorDialog::OnTab4CalcModeChange(void) { return(m_painel.m_tab4.OnTab4CalcModeChange()); }
bool CConstrutorDialog::OnTab4CalcRefChange(void) { return(m_painel.m_tab4.OnTab4CalcRefChange()); }
bool CConstrutorDialog::OnTab5PadraoChange(void) { return(m_painel.m_tab5.OnTab5PadraoChange()); }
bool CConstrutorDialog::OnTab5CandlesChange(void) { return(m_painel.m_tab5.OnTab5CandlesChange()); }
bool CConstrutorDialog::OnTab5CandlesDistanceChange(void) { return(m_painel.m_tab5.OnTab5CandlesDistanceChange()); }
bool CConstrutorDialog::OnTab5CandlesCountChange(void) { return(m_painel.m_tab5.OnTab5CandlesCountChange()); }
bool CConstrutorDialog::OnTab5IndicadorChange(void) { return(m_painel.m_tab5.OnTab5IndicadorChange()); }
bool CConstrutorDialog::OnTab6FixedChange(void) { return(m_painel.m_tab6.OnTab6FixedChange()); }
bool CConstrutorDialog::OnTab6CalcChange(void) { return(m_painel.m_tab6.OnTab6CalcChange()); }
bool CConstrutorDialog::OnTab6CalcModeOuterChange(void) { return(m_painel.m_tab6.OnTab6CalcModeOuterChange()); }
bool CConstrutorDialog::OnTab6CalcRefOuterChange(void) { return(m_painel.m_tab6.OnTab6CalcRefOuterChange()); }
bool CConstrutorDialog::OnTab6CalcModeChange(void) { return(m_painel.m_tab6.OnTab6CalcModeChange()); }
bool CConstrutorDialog::OnTab6CalcRefChange(void) { return(m_painel.m_tab6.OnTab6CalcRefChange()); }
bool CConstrutorDialog::OnTab7PadraoChange(void) { return(m_painel.m_tab7.OnTab7PadraoChange()); }
bool CConstrutorDialog::OnTab7CandlesChange(void) { return(m_painel.m_tab7.OnTab7CandlesChange()); }
bool CConstrutorDialog::OnTab7CandlesDistanceChange(void) { return(m_painel.m_tab7.OnTab7CandlesDistanceChange()); }
bool CConstrutorDialog::OnTab7CandlesCountChange(void) { return(m_painel.m_tab7.OnTab7CandlesCountChange()); }
bool CConstrutorDialog::OnTab7IndicadorChange(void) { return(m_painel.m_tab7.OnTab7IndicadorChange()); }

#endif // __CONSTRUTOR_DIALOG_MQH__
