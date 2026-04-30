#ifndef __CONSTRUTOR_V2_TAB3_STOP_MOVEL_MQH__
#define __CONSTRUTOR_V2_TAB3_STOP_MOVEL_MQH__

#include "..\\V2Shared.mqh"

class CTab3StopMovelV2 : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate    *m_host;
   SConstrutorSettings m_settings;
   bool              m_has_settings;
   bool              m_created;
   int               m_window_index;
   int               m_tab_index;

   CEF_CTextLabel    m_type_label;
   CEF_CComboBox     m_type_combo;

   CEF_CFrame        m_card_padrao;
   CEF_CTextLabel    m_card_padrao_title;
   CEF_CCheckBox     m_use_padrao;
   CEF_CTextLabel    m_padrao_add_label;
   CEF_CTextEdit     m_padrao_add_spin;
   CEF_CTextLabel    m_padrao_pass_label;
   CEF_CTextEdit     m_padrao_pass_spin;

   CEF_CFrame        m_card_candles;
   CEF_CTextLabel    m_card_candles_title;
   CEF_CCheckBox     m_use_candles;
   CEF_CTextLabel    m_candles_trigger_label;
   CEF_CTextEdit     m_candles_trigger_spin;
   CEF_CTextLabel    m_candles_pos_label;
   CEF_CComboBox     m_candles_pos_combo;
   CEF_CTextLabel    m_candles_price_label;
   CEF_CComboBox     m_candles_price_combo;
   CEF_CTextLabel    m_candles_dist_label;
   CEF_CTextEdit     m_candles_dist_spin;

   CEF_CFrame        m_card_indicador;
   CEF_CTextLabel    m_card_indicador_title;
   CEF_CCheckBox     m_use_indicador;
   CEF_CTextLabel    m_indicador_trigger_label;
   CEF_CTextEdit     m_indicador_trigger_spin;
   CEF_CTextLabel    m_indicador_tipo_label;
   CEF_CComboBox     m_indicador_combo;

   bool CreateComboControl(CEF_CComboBox &combo,CElement &owner,CEF_CTabs &tabs,const int tab_index,const int x,const int y,const int width,const int list_height,const string &items[],const int selected_index,const color border)
     {
      combo.MainPointer(owner);
      tabs.AddToElementsArray(tab_index,combo);
      combo.ItemsTotal(ArraySize(items));
      for(int i=0;i<ArraySize(items);i++)
         combo.SetValue(i,items[i]);
      V2StyleCombo(combo,border,width,list_height,width-2);
      if(!combo.CreateComboBox("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,combo);
      combo.SelectItem(V2ClampIndex(selected_index,0,ArraySize(items)-1));
      return(true);
     }

   bool CreateSpinControl(CEF_CTextEdit &spin,CElement &owner,CEF_CTabs &tabs,const int tab_index,const int x,const int y,const int width,const double max_value,const double min_value,const double step,const int digits,const string value,const color back,const color border)
     {
      spin.MainPointer(owner);
      tabs.AddToElementsArray(tab_index,spin);
      V2StyleSpin(spin,back,border,width,max_value,min_value,step,digits,value);
      if(!spin.CreateTextEdit("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,spin);
      return(true);
     }

   void RefreshModeChecks(void)
     {
      m_use_padrao.Update(true);
      m_use_candles.Update(true);
      m_use_indicador.Update(true);
     }

public:
                     CTab3StopMovelV2(void) : m_host(NULL), m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

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
      const int content_y=120;
      const int content_w=tabs_w-(content_pad*2);
      const int card_gap=12;
      const int card_w=(content_w-(card_gap*2))/3;
      const int card_h=340;
      const int field_x=16;
      const int field_w=card_w-32;
      const int label_h=18;
      const int control_h=20;
      const int v_gap=10;
      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color field_border=V2_COLOR_FIELD_BORDER;

      if(!V2CreateFieldLabel(*m_host,m_type_label,"Tipo de stop",tabs,tabs,m_window_index,m_tab_index,content_pad,66,260,18))
         return(false);
      string stop_items[];
      V2ItemsStopTipo(stop_items);
      if(!CreateComboControl(m_type_combo,tabs,tabs,m_tab_index,content_pad,88,260,80,stop_items,0,field_border))
         return(false);

      if(!V2CreateCard(*m_host,m_card_padrao,tabs,m_window_index,m_tab_index,content_pad,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_padrao_title,"Stop movel (padrao)",m_card_padrao,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_padrao,"Usar padrao",m_card_padrao,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_padrao.FontSize(10);
      m_use_padrao.LabelColor(V2_COLOR_TEXT_PRIMARY);

      int y=76;
      if(!V2CreateFieldLabel(*m_host,m_padrao_add_label,"Adicionar a favor",m_card_padrao,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_padrao_add_spin,m_card_padrao,tabs,m_tab_index,field_x,y,field_w,9999.0,0.0,1.0,0,"0",card_back,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_padrao_pass_label,"Passo",m_card_padrao,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_padrao_pass_spin,m_card_padrao,tabs,m_tab_index,field_x,y,field_w,9999.0,0.0,1.0,0,"0",card_back,field_border))
         return(false);

      const int candles_x=content_pad+card_w+card_gap;
      if(!V2CreateCard(*m_host,m_card_candles,tabs,m_window_index,m_tab_index,candles_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_candles_title,"Stop movel (candles)",m_card_candles,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_candles,"Usar por distancia",m_card_candles,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_candles.FontSize(10);
      m_use_candles.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string base_items[];
      V2ItemsBaseMedia(base_items);
      y=76;
      if(!V2CreateFieldLabel(*m_host,m_candles_trigger_label,"Disparo de distancia",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_candles_trigger_spin,m_card_candles,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,0.1,1,"0.0",card_back,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_candles_pos_label,"Posicao de referencia",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_candles_pos_combo,m_card_candles,tabs,m_tab_index,field_x,y,field_w,120,base_items,0,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_candles_price_label,"Base do candle",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_candles_price_combo,m_card_candles,tabs,m_tab_index,field_x,y,field_w,120,base_items,1,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_candles_dist_label,"Distancia do stop",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_candles_dist_spin,m_card_candles,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,0.1,1,"0.0",card_back,field_border))
         return(false);

      const int indicador_x=content_pad+(card_w+card_gap)*2;
      if(!V2CreateCard(*m_host,m_card_indicador,tabs,m_window_index,m_tab_index,indicador_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_indicador_title,"Stop movel (indicador)",m_card_indicador,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_indicador,"Usar indicador",m_card_indicador,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_indicador.FontSize(10);
      m_use_indicador.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string indicador_items[];
      ArrayResize(indicador_items,5);
      indicador_items[0]="ATR";
      indicador_items[1]="Media movel";
      indicador_items[2]="Parabolic SAR";
      indicador_items[3]="Bandas de Bollinger";
      indicador_items[4]="Envelopes";

      y=76;
      if(!V2CreateFieldLabel(*m_host,m_indicador_trigger_label,"Disparo de distancia",m_card_indicador,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_indicador_trigger_spin,m_card_indicador,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,0.1,1,"0.0",card_back,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_indicador_tipo_label,"Indicador",m_card_indicador,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_indicador_combo,m_card_indicador,tabs,m_tab_index,field_x,y,field_w,140,indicador_items,0,field_border))
         return(false);

      m_created=true;
      return(true);
     }

   void Load()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_stop=(m_settings.stop_movel==CONSTRUTOR_SIM);
      const bool use_candles=(use_stop && m_settings.stop_movel_modo==CONSTRUTOR_STOP_MOVEL_CANDLES);
      const bool use_indicador=(use_stop && m_settings.stop_movel_modo==CONSTRUTOR_STOP_MOVEL_INDICADOR);
      const bool use_padrao=(use_stop && !use_candles && !use_indicador);

      m_use_padrao.IsPressed(use_padrao);
      m_use_candles.IsPressed(use_candles);
      m_use_indicador.IsPressed(use_indicador);

      m_type_combo.SelectItem(V2ClampIndex((int)m_settings.tipo_stop_movel,0,1));
      m_padrao_add_spin.SetValue(IntegerToString(m_settings.stop_movel_padrao_adicionar_favor>=0 ? m_settings.stop_movel_padrao_adicionar_favor : 0));
      m_padrao_pass_spin.SetValue(IntegerToString(m_settings.stop_movel_padrao_passo>=0 ? m_settings.stop_movel_padrao_passo : 0));
      m_candles_trigger_spin.SetValue(DoubleToString(m_settings.stop_movel_candles_disparo_distancia>=0.0 ? m_settings.stop_movel_candles_disparo_distancia : 0.0,1));
      m_candles_pos_combo.SelectItem(V2ClampIndex((int)m_settings.stop_movel_candles_posicao,0,3));
      m_candles_price_combo.SelectItem(V2ClampIndex((int)m_settings.stop_movel_candles_candle_posicao,0,3));
      m_candles_dist_spin.SetValue(DoubleToString(m_settings.stop_movel_candles_distancia>=0.0 ? m_settings.stop_movel_candles_distancia : 0.0,1));
      m_indicador_trigger_spin.SetValue(DoubleToString(m_settings.stop_movel_indicador_disparo_distancia>=0.0 ? m_settings.stop_movel_indicador_disparo_distancia : 0.0,1));
      m_indicador_combo.SelectItem(V2ClampIndex((int)m_settings.stop_movel_indicador,0,4));
     }

   void Save()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_candles=m_use_candles.IsPressed();
      const bool use_indicador=(!use_candles && m_use_indicador.IsPressed());
      const bool use_padrao=(!use_candles && !use_indicador && m_use_padrao.IsPressed());

      m_settings.stop_movel=((use_padrao || use_candles || use_indicador) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.tipo_stop_movel=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)V2ClampIndex(m_type_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.stop_movel_padrao_adicionar_favor=(int)StringToInteger(m_padrao_add_spin.GetValue());
      m_settings.stop_movel_padrao_passo=(int)StringToInteger(m_padrao_pass_spin.GetValue());
      m_settings.stop_movel_candles_disparo_distancia=StringToDouble(m_candles_trigger_spin.GetValue());
      m_settings.stop_movel_candles_posicao=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_candles_pos_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_movel_candles_candle_posicao=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_candles_price_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.stop_movel_candles_distancia=StringToDouble(m_candles_dist_spin.GetValue());
      m_settings.stop_movel_indicador_disparo_distancia=StringToDouble(m_indicador_trigger_spin.GetValue());
      m_settings.stop_movel_indicador=(ENUM_CONSTRUTOR_STOP_MOVEL_INDICADOR)V2ClampIndex(m_indicador_combo.GetListViewPointer().SelectedItemIndex(),0,4);

      if(use_candles)
         m_settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_CANDLES;
      else if(use_indicador)
         m_settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_INDICADOR;
      else
         m_settings.stop_movel_modo=CONSTRUTOR_STOP_MOVEL_PADRAO;

      m_settings.stop_movel_candles_modo=CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA;
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      if(!m_created)
         return(false);
      if(id!=CHARTEVENT_CUSTOM+ON_CLICK_CHECKBOX)
         return(false);

      const int clicked_id=(int)lparam;
      if(m_use_padrao.Id()==clicked_id)
        {
         if(m_use_padrao.IsPressed())
           {
            m_use_candles.IsPressed(false);
            m_use_indicador.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      if(m_use_candles.Id()==clicked_id)
        {
         if(m_use_candles.IsPressed())
           {
            m_use_padrao.IsPressed(false);
            m_use_indicador.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      if(m_use_indicador.Id()==clicked_id)
        {
         if(m_use_indicador.IsPressed())
           {
            m_use_padrao.IsPressed(false);
            m_use_candles.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB3_STOP_MOVEL_MQH__
