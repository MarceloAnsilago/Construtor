#ifndef __CONSTRUTOR_V2_TAB6_TRAILING_STOP_MQH__
#define __CONSTRUTOR_V2_TAB6_TRAILING_STOP_MQH__

#include "..\\V2Shared.mqh"

class CTab6TrailingStopV2 : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate      *m_host;
   SConstrutorSettings  m_settings;
   bool                 m_has_settings;
   bool                 m_created;
   int                  m_window_index;
   int                  m_tab_index;

   CEF_CTextLabel       m_type_label;
   CEF_CComboBox        m_type_combo;

   CEF_CFrame           m_card_padrao;
   CEF_CTextLabel       m_card_padrao_title;
   CEF_CCheckBox        m_use_padrao;
   CEF_CTextLabel       m_padrao_add_label;
   CEF_CTextEdit        m_padrao_add_spin;
   CEF_CTextLabel       m_padrao_passo_label;
   CEF_CTextEdit        m_padrao_passo_spin;

   CEF_CFrame           m_card_candles;
   CEF_CTextLabel       m_card_candles_title;
   CEF_CCheckBox        m_use_candles;
   CEF_CTextLabel       m_candles_trigger_label;
   CEF_CTextEdit        m_candles_trigger_spin;
   CEF_CTextLabel       m_candles_base_label;
   CEF_CComboBox        m_candles_base_combo;
   CEF_CTextLabel       m_candles_candle_label;
   CEF_CComboBox        m_candles_candle_combo;
   CEF_CTextLabel       m_candles_dist_label;
   CEF_CTextEdit        m_candles_dist_spin;

   CEF_CFrame           m_card_indicador;
   CEF_CTextLabel       m_card_indicador_title;
   CEF_CCheckBox        m_use_indicador;
   CEF_CTextLabel       m_indicador_trigger_label;
   CEF_CTextEdit        m_indicador_trigger_spin;
   CEF_CTextLabel       m_indicador_tipo_label;
   CEF_CComboBox        m_indicador_combo;

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
                     CTab6TrailingStopV2(void) : m_host(NULL), m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

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
      const int type_y=66;
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

      if(!V2CreateFieldLabel(*m_host,m_type_label,"Tipo de calculo",tabs,tabs,m_window_index,m_tab_index,content_pad,type_y,260,18))
         return(false);
      string type_items[];
      V2ItemsStopTipo(type_items);
      if(!CreateComboControl(m_type_combo,tabs,tabs,m_tab_index,content_pad,type_y+22,260,80,type_items,0,field_border))
         return(false);

      if(!V2CreateCard(*m_host,m_card_padrao,tabs,m_window_index,m_tab_index,content_pad,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_padrao_title,"Trailing stop (padrao)",m_card_padrao,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_padrao,"Usar trailing stop padrao",m_card_padrao,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_padrao.FontSize(10);
      m_use_padrao.LabelColor(V2_COLOR_TEXT_PRIMARY);

      int y=76;
      if(!V2CreateFieldLabel(*m_host,m_padrao_add_label,"Adicionar a favor",m_card_padrao,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_padrao_add_spin,m_card_padrao,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,1.0,1,"0.0",card_back,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_padrao_passo_label,"Passo",m_card_padrao,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_padrao_passo_spin,m_card_padrao,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,1.0,0,"0",card_back,field_border))
         return(false);

      const int candles_x=content_pad+card_w+card_gap;
      if(!V2CreateCard(*m_host,m_card_candles,tabs,m_window_index,m_tab_index,candles_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_candles_title,"Trailing stop (candle a candle)",m_card_candles,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_candles,"Candle a candle",m_card_candles,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_candles.FontSize(10);
      m_use_candles.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string base_items[];
      V2ItemsBaseMedia(base_items);
      string candle_items[];
      V2ItemsPosicaoReferencia(candle_items);

      y=76;
      if(!V2CreateFieldLabel(*m_host,m_candles_trigger_label,"Disparo de distancia",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_candles_trigger_spin,m_card_candles,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,1.0,1,"0.0",card_back,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_candles_base_label,"Base do candle",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_candles_base_combo,m_card_candles,tabs,m_tab_index,field_x,y,field_w,120,base_items,0,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_candles_candle_label,"Candle de referencia",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_candles_candle_combo,m_card_candles,tabs,m_tab_index,field_x,y,field_w,120,candle_items,1,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_candles_dist_label,"Distancia do trailing",m_card_candles,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_candles_dist_spin,m_card_candles,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,1.0,1,"0.0",card_back,field_border))
         return(false);

      const int indicador_x=content_pad+(card_w+card_gap)*2;
      if(!V2CreateCard(*m_host,m_card_indicador,tabs,m_window_index,m_tab_index,indicador_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_indicador_title,"Trailing stop (indicador)",m_card_indicador,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_indicador,"Usar indicador",m_card_indicador,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_indicador.FontSize(10);
      m_use_indicador.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string indicador_items[];
      ArrayResize(indicador_items,2);
      indicador_items[0]="Media movel";
      indicador_items[1]="Parabolic SAR";

      y=76;
      if(!V2CreateFieldLabel(*m_host,m_indicador_trigger_label,"Distancia para disparo",m_card_indicador,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateSpinControl(m_indicador_trigger_spin,m_card_indicador,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,0.1,1,"1.0",card_back,field_border))
         return(false);
      y+=control_h+v_gap;
      if(!V2CreateFieldLabel(*m_host,m_indicador_tipo_label,"Indicador",m_card_indicador,tabs,m_window_index,m_tab_index,field_x,y,field_w,label_h))
         return(false);
      y+=label_h+4;
      if(!CreateComboControl(m_indicador_combo,m_card_indicador,tabs,m_tab_index,field_x,y,field_w,80,indicador_items,0,field_border))
         return(false);

      m_created=true;
      return(true);
     }

   void Load()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_trailing=(m_settings.trailing_stop==CONSTRUTOR_SIM);
      const bool use_candles=(use_trailing && m_settings.trailing_stop_modo==CONSTRUTOR_STOP_MOVEL_CANDLES);
      const bool use_indicador=(use_trailing && m_settings.trailing_stop_modo==CONSTRUTOR_STOP_MOVEL_INDICADOR);
      const bool use_padrao=(use_trailing && !use_candles && !use_indicador);

      m_use_padrao.IsPressed(use_padrao);
      m_use_candles.IsPressed(use_candles);
      m_use_indicador.IsPressed(use_indicador);

      m_type_combo.SelectItem(V2ClampIndex((int)m_settings.tipo_trailing_stop,0,1));
      m_padrao_add_spin.SetValue(DoubleToString(m_settings.trailing_stop_padrao_adicionar_favor>=0 ? m_settings.trailing_stop_padrao_adicionar_favor : 0,1));
      m_padrao_passo_spin.SetValue(IntegerToString(m_settings.trailing_stop_padrao_passo>=0 ? m_settings.trailing_stop_padrao_passo : 0));
      m_candles_trigger_spin.SetValue(DoubleToString(m_settings.trailing_stop_candles_disparo_distancia>=0.0 ? m_settings.trailing_stop_candles_disparo_distancia : 0.0,1));
      m_candles_base_combo.SelectItem(V2ClampIndex((int)m_settings.trailing_stop_candles_posicao,0,3));
      m_candles_candle_combo.SelectItem(V2ClampIndex(m_settings.trailing_stop_candles_count>=0 ? m_settings.trailing_stop_candles_count : 1,0,3));
      m_candles_dist_spin.SetValue(DoubleToString(m_settings.trailing_stop_candles_distancia>=0.0 ? m_settings.trailing_stop_candles_distancia : 0.0,1));
      m_indicador_trigger_spin.SetValue(DoubleToString(m_settings.trailing_stop_indicador_disparo_distancia>=0.0 ? m_settings.trailing_stop_indicador_disparo_distancia : 1.0,1));

      int indicador_index=0;
      if(m_settings.trailing_stop_indicador==CONSTRUTOR_STOP_IND_PARABOLIC_SAR)
         indicador_index=1;
      m_indicador_combo.SelectItem(indicador_index);
     }

   void Save()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_candles=m_use_candles.IsPressed();
      const bool use_indicador=(!use_candles && m_use_indicador.IsPressed());
      const bool use_padrao=(!use_candles && !use_indicador && m_use_padrao.IsPressed());

      m_settings.trailing_stop=((use_padrao || use_candles || use_indicador) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.tipo_trailing_stop=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)V2ClampIndex(m_type_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.trailing_stop_padrao_adicionar_favor=(int)StringToInteger(m_padrao_add_spin.GetValue());
      m_settings.trailing_stop_padrao_passo=(int)StringToInteger(m_padrao_passo_spin.GetValue());
      m_settings.trailing_stop_candles_disparo_distancia=StringToDouble(m_candles_trigger_spin.GetValue());
      m_settings.trailing_stop_candles_posicao=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_candles_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.trailing_stop_candles_count=V2ClampIndex(m_candles_candle_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.trailing_stop_candles_count_posicao=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_candles_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.trailing_stop_candles_distancia=StringToDouble(m_candles_dist_spin.GetValue());
      m_settings.trailing_stop_indicador_disparo_distancia=StringToDouble(m_indicador_trigger_spin.GetValue());
      m_settings.trailing_stop_indicador=(m_indicador_combo.GetListViewPointer().SelectedItemIndex()==1 ? CONSTRUTOR_STOP_IND_PARABOLIC_SAR : CONSTRUTOR_STOP_IND_MEDIA_MOVEL);

      if(use_candles)
         m_settings.trailing_stop_modo=CONSTRUTOR_STOP_MOVEL_CANDLES;
      else if(use_indicador)
         m_settings.trailing_stop_modo=CONSTRUTOR_STOP_MOVEL_INDICADOR;
      else
         m_settings.trailing_stop_modo=CONSTRUTOR_STOP_MOVEL_PADRAO;

      m_settings.trailing_stop_candles_modo=CONSTRUTOR_STOP_MOVEL_CANDLES_DISTANCIA;
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
         if(!m_use_padrao.IsPressed())
            m_use_padrao.IsPressed(true);
         m_use_candles.IsPressed(false);
         m_use_indicador.IsPressed(false);
         RefreshModeChecks();
         return(true);
        }
      if(m_use_candles.Id()==clicked_id)
        {
         if(!m_use_candles.IsPressed())
            m_use_candles.IsPressed(true);
         m_use_padrao.IsPressed(false);
         m_use_indicador.IsPressed(false);
         RefreshModeChecks();
         return(true);
        }
      if(m_use_indicador.Id()==clicked_id)
        {
         if(!m_use_indicador.IsPressed())
            m_use_indicador.IsPressed(true);
         m_use_padrao.IsPressed(false);
         m_use_candles.IsPressed(false);
         RefreshModeChecks();
         return(true);
        }
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB6_TRAILING_STOP_MQH__
