#ifndef __CONSTRUTOR_V2_TAB1_INF_INICIAIS_MQH__
#define __CONSTRUTOR_V2_TAB1_INF_INICIAIS_MQH__

#include "..\\V2Shared.mqh"

class CTab1InfIniciaisV2 : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate    *m_host;
   SConstrutorSettings m_settings;
   bool              m_has_settings;
   bool              m_created;
   int               m_window_index;
   int               m_tab_index;

   CEF_CFrame        m_card_basic;
   CEF_CFrame        m_card_direction;
   CEF_CFrame        m_card_schedule;
   CEF_CFrame        m_card_config;

   CEF_CTextLabel    m_card_basic_title;
   CEF_CTextLabel    m_card_direction_title;
   CEF_CTextLabel    m_card_schedule_title;
   CEF_CTextLabel    m_card_config_title;

   CEF_CTextLabel    m_name_label;
   CEF_CTextEdit     m_name_edit;
   CEF_CTextLabel    m_market_label;
   CEF_CComboBox     m_market_combo;
   CEF_CTextLabel    m_oper_label;
   CEF_CComboBox     m_oper_combo;
   CEF_CTextLabel    m_mode_label;
   CEF_CComboBox     m_mode_combo;

   CEF_CTextLabel    m_buy_label;
   CEF_CComboBox     m_buy_combo;
   CEF_CTextLabel    m_sell_label;
   CEF_CComboBox     m_sell_combo;

   CEF_CTextLabel    m_start_label;
   CEF_CTimeEdit     m_start_time_edit;
   CEF_CTextLabel    m_end_label;
   CEF_CTimeEdit     m_end_time_edit;
   CEF_CSeparateLine m_schedule_sep;
   CEF_CTextLabel    m_zero_label;
   CEF_CComboBox     m_zero_combo;
   CEF_CTextLabel    m_zero_time_label;
   CEF_CTimeEdit     m_zero_time_edit;

   CEF_CTextLabel    m_tempo_label;
   CEF_CComboBox     m_tempo_combo;
   CEF_CTextLabel    m_volume_label;
   CEF_CTextEdit     m_volume_edit;
   CEF_CTextLabel    m_spread_label;
   CEF_CTextEdit     m_spread_edit;
   CEF_CTextLabel    m_debug_label;

public:
                     CTab1InfIniciaisV2(void) : m_host(NULL), m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

   bool CreateComboControl(CEF_CComboBox &combo,CElement &owner,CEF_CTabs &tabs,const int x,const int y,const int width,const int list_height,const string &items[],const int selected_index)
     {
      combo.MainPointer(owner);
      tabs.AddToElementsArray(m_tab_index,combo);
      combo.ItemsTotal(ArraySize(items));
      for(int i=0;i<ArraySize(items);i++)
         combo.SetValue(i,items[i]);
      V2StyleCombo(combo,V2_COLOR_FIELD_BORDER,width,list_height,width-2);
      if(!combo.CreateComboBox("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,combo);
      combo.SelectItem(V2ClampIndex(selected_index,0,ArraySize(items)-1));
      return(true);
     }

   bool CreateSpinControl(CEF_CTextEdit &spin,CElement &owner,CEF_CTabs &tabs,const int x,const int y,const int width,const double max_value,const double min_value,const double step,const int digits,const string value,const color back,const color border)
     {
      spin.MainPointer(owner);
      tabs.AddToElementsArray(m_tab_index,spin);
      V2StyleSpin(spin,back,border,width,max_value,min_value,step,digits,value);
      if(!spin.CreateTextEdit("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,spin);
      return(true);
     }

   bool CreateTextInputControl(CEF_CTextEdit &edit,CElement &owner,CEF_CTabs &tabs,const int x,const int y,const int width,const string value)
     {
      if(!m_host.CreateTextEdit(edit,"",owner,m_window_index,tabs,m_tab_index,false,x,y,width,width,value,""))
         return(false);
      V2StyleTextEdit(edit,V2_COLOR_FIELD_BORDER,width);
      edit.SetValue(value);
      return(true);
     }

   bool CreateTimeEditControl(CEF_CTimeEdit &time_edit,CElement &owner,CEF_CTabs &tabs,const int x,const int y,const int width,const int hours,const int minutes)
     {
      time_edit.MainPointer(owner);
      tabs.AddToElementsArray(m_tab_index,time_edit);
      time_edit.XSize(width);
      time_edit.YSize(20);
      time_edit.CheckBoxMode(false);
      time_edit.BackColor(clrWhite);
      time_edit.BackColorHover(clrWhite);
      time_edit.BackColorPressed(clrWhite);
      time_edit.BorderColor(V2_COLOR_FIELD_BORDER);
      time_edit.BorderColorHover(V2_COLOR_FIELD_BORDER);
      time_edit.BorderColorPressed(V2_COLOR_FIELD_BORDER);
      if(!time_edit.CreateTimeEdit("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,time_edit);

      CEF_CTextEdit *hours_edit=time_edit.GetHoursEditPointer();
      CEF_CTextEdit *minutes_edit=time_edit.GetMinutesEditPointer();
      if(hours_edit!=NULL)
        {
         hours_edit.BackColor(clrWhite);
         hours_edit.BackColorHover(clrWhite);
         hours_edit.BackColorPressed(clrWhite);
         hours_edit.BorderColor(V2_COLOR_FIELD_BORDER);
         hours_edit.BorderColorHover(V2_COLOR_FIELD_BORDER);
         hours_edit.BorderColorPressed(V2_COLOR_FIELD_BORDER);
         hours_edit.GetTextBoxPointer().BorderColor(V2_COLOR_FIELD_BORDER);
         hours_edit.GetTextBoxPointer().BorderColorHover(V2_COLOR_FIELD_BORDER);
         hours_edit.GetTextBoxPointer().BorderColorPressed(V2_COLOR_FIELD_BORDER);
         hours_edit.SetDigits(0);
        }
      if(minutes_edit!=NULL)
        {
         minutes_edit.BackColor(clrWhite);
         minutes_edit.BackColorHover(clrWhite);
         minutes_edit.BackColorPressed(clrWhite);
         minutes_edit.BorderColor(V2_COLOR_FIELD_BORDER);
         minutes_edit.BorderColorHover(V2_COLOR_FIELD_BORDER);
         minutes_edit.BorderColorPressed(V2_COLOR_FIELD_BORDER);
         minutes_edit.GetTextBoxPointer().BorderColor(V2_COLOR_FIELD_BORDER);
         minutes_edit.GetTextBoxPointer().BorderColorHover(V2_COLOR_FIELD_BORDER);
         minutes_edit.GetTextBoxPointer().BorderColorPressed(V2_COLOR_FIELD_BORDER);
         minutes_edit.SetDigits(0);
        }

      time_edit.SetHours((uint)V2ClampIndex(hours,0,23));
      time_edit.SetMinutes((uint)V2ClampIndex(minutes,0,59));
      return(true);
     }

   void SetSettings(const SConstrutorSettings &settings)
     {
      m_settings=settings;
      m_has_settings=true;
     }

   void ExportSettings(SConstrutorSettings &settings)
     {
      if(!m_has_settings)
         return;
      settings=m_settings;
     }

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int content_pad=24;
      const int content_y=78;
      const int content_w=tabs_w-(content_pad*2);
      const int card_gap=12;
      const int card_w=(content_w-(card_gap*3))/4;
      const int card_h=420;
      const int field_x=16;
      const int field_w=card_w-32;
      const int label_h=18;
      const int control_h=20;
      const int v_gap=10;
      const int start_y=44;
      const int list_h=200;

      if(!CreateTextLabel(m_debug_label,"TAB1 DEBUG OK",tabs,m_window_index,tabs,m_tab_index,24,78,220,18))
         return(false);
      m_debug_label.FontSize(10);
      m_debug_label.LabelColor(clrRed);

      if(!V2CreateCard(*m_host,m_card_basic,tabs,m_window_index,m_tab_index,content_pad,content_y,card_w,card_h,V2_COLOR_CARD_BACK,V2_COLOR_CARD_BORDER))
         return(false);
      if(!V2CreateCard(*m_host,m_card_direction,tabs,m_window_index,m_tab_index,content_pad+card_w+card_gap,content_y,card_w,card_h,V2_COLOR_CARD_BACK,V2_COLOR_CARD_BORDER))
         return(false);
      if(!V2CreateCard(*m_host,m_card_schedule,tabs,m_window_index,m_tab_index,content_pad+(card_w+card_gap)*2,content_y,card_w,card_h,V2_COLOR_CARD_BACK,V2_COLOR_CARD_BORDER))
         return(false);
      if(!V2CreateCard(*m_host,m_card_config,tabs,m_window_index,m_tab_index,content_pad+(card_w+card_gap)*3,content_y,card_w,card_h,V2_COLOR_CARD_BACK,V2_COLOR_CARD_BORDER))
         return(false);

      if(!V2CreateCardTitle(*m_host,m_card_basic_title,"Informacoes basicas",m_card_basic,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_direction_title,"Direcao operacional",m_card_direction,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_schedule_title,"Horario e zeragem",m_card_schedule,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_config_title,"Configuracao inicial",m_card_config,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);

      string items_market[];
      string items_oper[];
      string items_mode[];
      string items_yesno[];
      string items_tf[];
      V2ItemsMercado(items_market);
      V2ItemsTipoOperacional(items_oper);
      V2ItemsModoProcessamento(items_mode);
      V2ItemsSimNao(items_yesno);
      V2ItemsTempoGrafico(items_tf);

      int y=start_y;
      if(!V2CreateFieldLabel(*m_host,m_name_label,"Nome da estrategia",m_card_basic,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateTextInputControl(m_name_edit,m_card_basic,tabs,field_x,y,field_w,"Minha estrategia"))
         return(false);
      y+=control_h+v_gap;

      if(!V2CreateFieldLabel(*m_host,m_market_label,"Mercado desejado",m_card_basic,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_market_combo,m_card_basic,tabs,field_x,y,field_w,list_h,items_market,0))
         return(false);
      y+=control_h+v_gap;

      if(!V2CreateFieldLabel(*m_host,m_oper_label,"Tipo operacional",m_card_basic,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_oper_combo,m_card_basic,tabs,field_x,y,field_w,list_h,items_oper,0))
         return(false);
      y+=control_h+v_gap;

      if(!V2CreateFieldLabel(*m_host,m_mode_label,"Modo de processamento",m_card_basic,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_mode_combo,m_card_basic,tabs,field_x,y,field_w,list_h,items_mode,0))
         return(false);

      y=start_y;
      if(!V2CreateFieldLabel(*m_host,m_buy_label,"Operar na compra",m_card_direction,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_buy_combo,m_card_direction,tabs,field_x,y,field_w,120,items_yesno,1))
         return(false);
      y+=control_h+v_gap;

      if(!V2CreateFieldLabel(*m_host,m_sell_label,"Operar na venda",m_card_direction,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_sell_combo,m_card_direction,tabs,field_x,y,field_w,120,items_yesno,1))
         return(false);

      const int sched_x=16;
      const int sched_w=card_w-32;
      int sy=start_y;

      if(!V2CreateFieldLabel(*m_host,m_start_label,"Inicio das operacoes",m_card_schedule,tabs,m_window_index,m_tab_index,sched_x,sy,sched_w))
         return(false);
      sy+=22;
      if(!CreateTimeEditControl(m_start_time_edit,m_card_schedule,tabs,sched_x,sy,sched_w,9,0))
         return(false);

      sy+=control_h+12;
      if(!V2CreateFieldLabel(*m_host,m_end_label,"Fim das operacoes",m_card_schedule,tabs,m_window_index,m_tab_index,sched_x,sy,sched_w))
         return(false);
      sy+=22;
      if(!CreateTimeEditControl(m_end_time_edit,m_card_schedule,tabs,sched_x,sy,sched_w,17,0))
         return(false);

      sy+=control_h+14;
      m_schedule_sep.MainPointer(m_card_schedule);
      tabs.AddToElementsArray(m_tab_index,m_schedule_sep);
      m_schedule_sep.DarkColor(V2_COLOR_CARD_BORDER);
      m_schedule_sep.LightColor(V2_COLOR_CARD_BACK);
      m_schedule_sep.TypeSepLine(H_SEP_LINE);
      if(!m_schedule_sep.CreateSeparateLine(sched_x,sy,sched_w,2))
         return(false);
      m_host.RegisterElement(m_window_index,m_schedule_sep);
      sy+=10;

      if(!V2CreateFieldLabel(*m_host,m_zero_label,"Zerar posicoes",m_card_schedule,tabs,m_window_index,m_tab_index,sched_x,sy,sched_w))
         return(false);
      sy+=22;
      if(!CreateComboControl(m_zero_combo,m_card_schedule,tabs,sched_x,sy,sched_w,120,items_yesno,0))
         return(false);

      sy+=control_h+12;
      if(!V2CreateFieldLabel(*m_host,m_zero_time_label,"Horario de zeragem",m_card_schedule,tabs,m_window_index,m_tab_index,sched_x,sy,sched_w))
         return(false);
      sy+=22;
      if(!CreateTimeEditControl(m_zero_time_edit,m_card_schedule,tabs,sched_x,sy,sched_w,17,30))
         return(false);

      int cy=start_y;
      if(!V2CreateFieldLabel(*m_host,m_tempo_label,"Tempo grafico",m_card_config,tabs,m_window_index,m_tab_index,field_x,cy,field_w,label_h))
         return(false);
      cy+=label_h+4;
      if(!CreateComboControl(m_tempo_combo,m_card_config,tabs,field_x,cy,field_w,200,items_tf,0))
         return(false);

      cy+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_volume_label,"Volume inicial",m_card_config,tabs,m_window_index,m_tab_index,field_x,cy,field_w,label_h))
         return(false);
      cy+=label_h+4;
      if(!CreateTextInputControl(m_volume_edit,m_card_config,tabs,field_x,cy,field_w,"1.00"))
         return(false);

      cy+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_spread_label,"Spread maximo",m_card_config,tabs,m_window_index,m_tab_index,field_x,cy,field_w,label_h))
         return(false);
      cy+=label_h+4;
      if(!CreateSpinControl(m_spread_edit,m_card_config,tabs,field_x,cy,field_w,100000.0,0.0,1.0,0,"10",clrWhite,V2_COLOR_FIELD_BORDER))
         return(false);

      m_created=true;
      return(true);
     }

   void Load(void)
     {
      if(!m_has_settings || !m_created)
         return;

      m_name_edit.SetValue(m_settings.estrategia_nome);
      m_market_combo.SelectItem(V2ClampIndex((int)m_settings.mercado,0,1));
      m_oper_combo.SelectItem(V2ClampIndex((int)m_settings.tipo_operacional,0,1));
      m_mode_combo.SelectItem(V2ClampIndex((int)m_settings.modo_processamento,0,1));
      m_buy_combo.SelectItem(V2ClampIndex((int)m_settings.operar_compra,0,1));
      m_sell_combo.SelectItem(V2ClampIndex((int)m_settings.operar_venda,0,1));
      m_start_time_edit.SetHours((uint)V2ClampIndex(m_settings.inicio_hora,0,23));
      m_start_time_edit.SetMinutes((uint)V2ClampIndex(m_settings.inicio_minuto,0,59));
      m_end_time_edit.SetHours((uint)V2ClampIndex(m_settings.fim_hora,0,23));
      m_end_time_edit.SetMinutes((uint)V2ClampIndex(m_settings.fim_minuto,0,59));
      m_zero_combo.SelectItem(V2ClampIndex((int)m_settings.zerar_posicoes,0,1));

      int zh=17;
      int zm=30;
      if(V2TryParseHourMin(m_settings.horario_zeragem,zh,zm))
        {
         m_zero_time_edit.SetHours((uint)V2ClampIndex(zh,0,23));
         m_zero_time_edit.SetMinutes((uint)V2ClampIndex(zm,0,59));
        }

      m_tempo_combo.SelectItem(V2ClampIndex((int)m_settings.tempo_grafico,0,20));
      m_volume_edit.SetValue(DoubleToString(m_settings.volume_inicial,2));
      m_spread_edit.SetValue(IntegerToString(m_settings.spread_maximo));
     }

   void Save(void)
     {
      if(!m_has_settings || !m_created)
         return;

      m_settings.estrategia_nome=m_name_edit.GetValue();
      m_settings.mercado=(ENUM_CONSTRUTOR_MERCADO)V2ClampIndex(m_market_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.tipo_operacional=(ENUM_CONSTRUTOR_TIPO_OPERACIONAL)V2ClampIndex(m_oper_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.modo_processamento=(ENUM_CONSTRUTOR_MODO_PROCESSAMENTO)V2ClampIndex(m_mode_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.operar_compra=(ENUM_CONSTRUTOR_SIM_NAO)V2ClampIndex(m_buy_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.operar_venda=(ENUM_CONSTRUTOR_SIM_NAO)V2ClampIndex(m_sell_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.inicio_hora=m_start_time_edit.GetHours();
      m_settings.inicio_minuto=m_start_time_edit.GetMinutes();
      m_settings.fim_hora=m_end_time_edit.GetHours();
      m_settings.fim_minuto=m_end_time_edit.GetMinutes();
      m_settings.zerar_posicoes=(ENUM_CONSTRUTOR_SIM_NAO)V2ClampIndex(m_zero_combo.GetListViewPointer().SelectedItemIndex(),0,1);

      const int zh=m_zero_time_edit.GetHours();
      const int zm=m_zero_time_edit.GetMinutes();
      m_settings.horario_zeragem=StringFormat("%02d:%02d",zh,zm);

      m_settings.tempo_grafico=(ENUM_CONSTRUTOR_TEMPO_GRAFICO)V2ClampIndex(m_tempo_combo.GetListViewPointer().SelectedItemIndex(),0,20);
      m_settings.volume_inicial=StringToDouble(m_volume_edit.GetValue());
      m_settings.spread_maximo=(int)StringToInteger(m_spread_edit.GetValue());
     }
  };

#endif // __CONSTRUTOR_V2_TAB1_INF_INICIAIS_MQH__
