#ifndef __CONSTRUTOR_V2_TAB4_TAKE_PROFIT_MQH__
#define __CONSTRUTOR_V2_TAB4_TAKE_PROFIT_MQH__

#include "..\\V2Shared.mqh"

class CTab4TakeProfitV2 : public CEF_CWndCreate
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

   CEF_CFrame           m_card_fixed;
   CEF_CTextLabel       m_card_fixed_title;
   CEF_CCheckBox        m_use_fixed;
   CEF_CTextLabel       m_fixed_dist_label;
   CEF_CTextEdit        m_fixed_dist_spin;

   CEF_CFrame           m_card_calc;
   CEF_CTextLabel       m_card_calc_title;
   CEF_CCheckBox        m_use_calc;
   CEF_CTabs            m_calc_tabs;
   CEF_CCheckBox        m_calc_ref_check;
   CEF_CCheckBox        m_calc_media_check;
   CEF_CCheckBox        m_calc_maxmin_check;
   CEF_CFrame           m_calc_ref_card;
   CEF_CTextLabel       m_calc_ref_base_label;
   CEF_CComboBox        m_calc_ref_base_combo;
   CEF_CTextLabel       m_calc_ref_candle_label;
   CEF_CComboBox        m_calc_ref_candle_combo;
   CEF_CTextLabel       m_calc_ref_distance_label;
   CEF_CTextEdit        m_calc_ref_distance_spin;
   CEF_CTextLabel       m_calc_ref_expire_label;
   CEF_CComboBox        m_calc_ref_expire_combo;
   CEF_CFrame           m_calc_media_card;
   CEF_CTextLabel       m_calc_media_candles_label;
   CEF_CTextEdit        m_calc_media_candles_spin;
   CEF_CTextLabel       m_calc_media_base_label;
   CEF_CComboBox        m_calc_media_base_combo;
   CEF_CTextLabel       m_calc_media_distance_label;
   CEF_CTextEdit        m_calc_media_distance_spin;
   CEF_CTextLabel       m_calc_media_expire_label;
   CEF_CComboBox        m_calc_media_expire_combo;
   CEF_CFrame           m_calc_maxmin_card;
   CEF_CTextLabel       m_calc_maxmin_base_label;
   CEF_CComboBox        m_calc_maxmin_base_combo;
   CEF_CTextLabel       m_calc_maxmin_count_label;
   CEF_CTextEdit        m_calc_maxmin_count_spin;

   CEF_CFrame           m_card_mult;
   CEF_CTextLabel       m_card_mult_title;
   CEF_CCheckBox        m_use_mult;
   CEF_CTextLabel       m_mult_base_label;
   CEF_CComboBox        m_mult_base_combo;
   CEF_CTextLabel       m_mult_candle_label;
   CEF_CComboBox        m_mult_candle_combo;
   CEF_CTextLabel       m_mult_qty_label;
   CEF_CTextEdit        m_mult_qty_spin;

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
      m_use_fixed.Update(true);
      m_use_calc.Update(true);
      m_use_mult.Update(true);
      m_use_indicador.Update(true);
     }

   void RefreshCalcChecks(void)
     {
      m_calc_ref_check.Update(true);
      m_calc_media_check.Update(true);
      m_calc_maxmin_check.Update(true);
     }

public:
                     CTab4TakeProfitV2(void) : m_host(NULL), m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

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
      const int card_w=(content_w-(card_gap*3))/4;
      const int card_h=356;
      const int field_x=16;
      const int field_w=card_w-32;
      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color field_border=V2_COLOR_FIELD_BORDER;
      const color sub_back=V2_COLOR_SURFACE;
      const color sub_border=V2_COLOR_CARD_BORDER;

      if(!V2CreateFieldLabel(*m_host,m_type_label,"Tipo de calculo",tabs,tabs,m_window_index,m_tab_index,content_pad,type_y,260,18))
         return(false);

      string type_items[];
      V2ItemsStopTipo(type_items);
      if(!CreateComboControl(m_type_combo,tabs,tabs,m_tab_index,content_pad,type_y+22,260,80,type_items,0,field_border))
         return(false);

      const int fixed_x=content_pad;
      if(!V2CreateCard(*m_host,m_card_fixed,tabs,m_window_index,m_tab_index,fixed_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_fixed_title,"Take profit (fixo)",m_card_fixed,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_fixed,"Usar take profit fixo",m_card_fixed,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_fixed.FontSize(10);
      m_use_fixed.LabelColor(V2_COLOR_TEXT_PRIMARY);
      if(!V2CreateFieldLabel(*m_host,m_fixed_dist_label,"Take distancia",m_card_fixed,tabs,m_window_index,m_tab_index,field_x,76,field_w,18))
         return(false);
      if(!CreateSpinControl(m_fixed_dist_spin,m_card_fixed,tabs,m_tab_index,field_x,98,field_w,100000.0,0.0,1.0,1,"100.0",card_back,field_border))
         return(false);

      const int calc_x=content_pad+(card_w+card_gap);
      if(!V2CreateCard(*m_host,m_card_calc,tabs,m_window_index,m_tab_index,calc_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_calc_title,"Take profit (calculo)",m_card_calc,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_calc,"Usar calculo",m_card_calc,m_window_index,tabs,m_tab_index,16,34,field_w,false,false,false))
         return(false);
      m_use_calc.FontSize(10);
      m_use_calc.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string calc_tab_text[];
      int calc_tab_widths[];
      ArrayResize(calc_tab_text,3);
      ArrayResize(calc_tab_widths,3);
      calc_tab_text[0]="Ref.";
      calc_tab_text[1]="Med.";
      calc_tab_text[2]="Max/Min";
      calc_tab_widths[0]=74;
      calc_tab_widths[1]=64;
      calc_tab_widths[2]=82;

      const int calc_tabs_x=16;
      const int calc_tabs_y=76;
      const int calc_tabs_w=field_w;
      const int calc_tabs_h=card_h-92;

      m_calc_tabs.MainPointer(m_card_calc);
      tabs.AddToElementsArray(m_tab_index,m_calc_tabs);
      m_calc_tabs.XSize(calc_tabs_w);
      m_calc_tabs.YSize(calc_tabs_h);
      m_calc_tabs.IsCenterText(true);
      m_calc_tabs.PositionMode(TABS_TOP);
      m_calc_tabs.TabsYSize(22);
      m_calc_tabs.BackColorPressed(card_back);
      m_calc_tabs.BorderColor(card_border);
      m_calc_tabs.BorderColorHover(card_border);
      m_calc_tabs.BorderColorPressed(card_border);
      for(int k=0;k<3;k++)
         m_calc_tabs.AddTab(calc_tab_text[k],calc_tab_widths[k]);
      if(!m_calc_tabs.CreateTabs(calc_tabs_x,calc_tabs_y))
         return(false);
      m_host.RegisterElement(m_window_index,m_calc_tabs);

      CEF_CButtonsGroup *calc_bg=m_calc_tabs.GetButtonsGroupPointer();
      if(calc_bg!=NULL)
        {
         for(int b=0;b<3;b++)
           {
            calc_bg.GetButtonPointer(b).FontSize(8);
            calc_bg.GetButtonPointer(b).BackColor(V2_COLOR_TAB_BACK);
            calc_bg.GetButtonPointer(b).BackColorHover(V2_COLOR_TAB_BACK_HOVER);
            calc_bg.GetButtonPointer(b).BackColorPressed(V2_COLOR_TAB_ACTIVE);
            calc_bg.GetButtonPointer(b).BorderColor(V2_COLOR_TAB_BORDER);
            calc_bg.GetButtonPointer(b).BorderColorHover(V2_COLOR_TAB_BORDER);
            calc_bg.GetButtonPointer(b).BorderColorPressed(V2_COLOR_TAB_BORDER);
            calc_bg.GetButtonPointer(b).LabelColor(V2_COLOR_TEXT_SECONDARY);
            calc_bg.GetButtonPointer(b).LabelColorHover(V2_COLOR_TEXT_PRIMARY);
            calc_bg.GetButtonPointer(b).LabelColorPressed(V2_COLOR_TEXT_PRIMARY);
           }
        }

      const int calc_content_x=12;
      const int calc_content_y=6;
      const int calc_content_w=calc_tabs_w-(calc_content_x*2);
      const int subcard_x=calc_content_x;
      const int subcard_y=calc_content_y+18;
      const int subcard_w=calc_content_w;
      const int subcard_h=calc_tabs_h-subcard_y-10;
      const int subpad=12;
      const int subw=subcard_w-(subpad*2);
      const int sub_label_h=16;
      const int sub_control_h=20;
      const int sub_vgap=8;

      if(!m_host.CreateCheckbox(m_calc_ref_check,"Referencia",m_calc_tabs,m_window_index,m_calc_tabs,0,calc_content_x,calc_content_y,140,false,false,false))
         return(false);
      m_calc_ref_check.FontSize(10);
      m_calc_ref_check.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!m_host.CreateCheckbox(m_calc_media_check,"Media",m_calc_tabs,m_window_index,m_calc_tabs,1,calc_content_x,calc_content_y,140,false,false,false))
         return(false);
      m_calc_media_check.FontSize(10);
      m_calc_media_check.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!m_host.CreateCheckbox(m_calc_maxmin_check,"Max/Min",m_calc_tabs,m_window_index,m_calc_tabs,2,calc_content_x,calc_content_y,140,false,false,false))
         return(false);
      m_calc_maxmin_check.FontSize(10);
      m_calc_maxmin_check.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!V2CreateCard(*m_host,m_calc_ref_card,m_calc_tabs,m_window_index,0,subcard_x,subcard_y,subcard_w,subcard_h,sub_back,sub_border))
         return(false);
      if(!V2CreateCard(*m_host,m_calc_media_card,m_calc_tabs,m_window_index,1,subcard_x,subcard_y,subcard_w,subcard_h,sub_back,sub_border))
         return(false);
      if(!V2CreateCard(*m_host,m_calc_maxmin_card,m_calc_tabs,m_window_index,2,subcard_x,subcard_y,subcard_w,subcard_h,sub_back,sub_border))
         return(false);

      string ref_items[];
      V2ItemsBaseMedia(ref_items);
      string candle_items[];
      V2ItemsPosicaoReferencia(candle_items);
      string expire_items[];
      V2ItemsExpirar(expire_items);

      int y=10;
      if(!V2CreateFieldLabel(*m_host,m_calc_ref_base_label,"Referencia:",m_calc_ref_card,m_calc_tabs,m_window_index,0,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_ref_base_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateComboControl(m_calc_ref_base_combo,m_calc_ref_card,m_calc_tabs,0,subpad,y,subw,120,ref_items,0,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_ref_candle_label,"Candle:",m_calc_ref_card,m_calc_tabs,m_window_index,0,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_ref_candle_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateComboControl(m_calc_ref_candle_combo,m_calc_ref_card,m_calc_tabs,0,subpad,y,subw,120,candle_items,0,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_ref_distance_label,"Distancia:",m_calc_ref_card,m_calc_tabs,m_window_index,0,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_ref_distance_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateSpinControl(m_calc_ref_distance_spin,m_calc_ref_card,m_calc_tabs,0,subpad,y,subw,100000.0,0.0,1.0,1,"0.0",sub_back,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_ref_expire_label,"Expirar:",m_calc_ref_card,m_calc_tabs,m_window_index,0,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_ref_expire_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateComboControl(m_calc_ref_expire_combo,m_calc_ref_card,m_calc_tabs,0,subpad,y,subw,120,expire_items,0,sub_border))
         return(false);

      y=10;
      if(!V2CreateFieldLabel(*m_host,m_calc_media_candles_label,"Qtd candles",m_calc_media_card,m_calc_tabs,m_window_index,1,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_media_candles_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateSpinControl(m_calc_media_candles_spin,m_calc_media_card,m_calc_tabs,1,subpad,y,subw,9999.0,1.0,1.0,0,"3",sub_back,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_media_base_label,"Referencia:",m_calc_media_card,m_calc_tabs,m_window_index,1,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_media_base_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateComboControl(m_calc_media_base_combo,m_calc_media_card,m_calc_tabs,1,subpad,y,subw,120,ref_items,0,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_media_distance_label,"Distancia:",m_calc_media_card,m_calc_tabs,m_window_index,1,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_media_distance_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateSpinControl(m_calc_media_distance_spin,m_calc_media_card,m_calc_tabs,1,subpad,y,subw,100000.0,0.0,1.0,1,"0.0",sub_back,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_media_expire_label,"Expirar:",m_calc_media_card,m_calc_tabs,m_window_index,1,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_media_expire_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateComboControl(m_calc_media_expire_combo,m_calc_media_card,m_calc_tabs,1,subpad,y,subw,120,expire_items,0,sub_border))
         return(false);

      y=10;
      if(!V2CreateFieldLabel(*m_host,m_calc_maxmin_base_label,"Base:",m_calc_maxmin_card,m_calc_tabs,m_window_index,2,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_maxmin_base_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateComboControl(m_calc_maxmin_base_combo,m_calc_maxmin_card,m_calc_tabs,2,subpad,y,subw,80,ref_items,0,sub_border))
         return(false);
      y+=sub_control_h+sub_vgap;
      if(!V2CreateFieldLabel(*m_host,m_calc_maxmin_count_label,"Dos ultimos:",m_calc_maxmin_card,m_calc_tabs,m_window_index,2,subpad,y,subw,sub_label_h))
         return(false);
      m_calc_maxmin_count_label.FontSize(9);
      y+=sub_label_h+2;
      if(!CreateSpinControl(m_calc_maxmin_count_spin,m_calc_maxmin_card,m_calc_tabs,2,subpad,y,subw,9999.0,1.0,1.0,0,"3",sub_back,sub_border))
         return(false);

      const int mult_x=content_pad+(card_w+card_gap)*2;
      if(!V2CreateCard(*m_host,m_card_mult,tabs,m_window_index,m_tab_index,mult_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_mult_title,"Take profit (multiplicador)",m_card_mult,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_mult,"Usar multiplicador",m_card_mult,m_window_index,tabs,m_tab_index,16,34,field_w,false,false,false))
         return(false);
      m_use_mult.FontSize(10);
      m_use_mult.LabelColor(V2_COLOR_TEXT_PRIMARY);

      string mult_base_items[];
      V2ItemsBaseMultiplicador(mult_base_items);
      string mult_candle_items[];
      V2ItemsPosicaoReferencia(mult_candle_items);

      y=66;
      if(!V2CreateFieldLabel(*m_host,m_mult_base_label,"Base da referencia",m_card_mult,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateComboControl(m_mult_base_combo,m_card_mult,tabs,m_tab_index,field_x,y,field_w,80,mult_base_items,0,field_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_mult_candle_label,"Candle de referencia",m_card_mult,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateComboControl(m_mult_candle_combo,m_card_mult,tabs,m_tab_index,field_x,y,field_w,120,mult_candle_items,2,field_border))
         return(false);
      y+=28;
      if(!V2CreateFieldLabel(*m_host,m_mult_qty_label,"Multiplicador",m_card_mult,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateSpinControl(m_mult_qty_spin,m_card_mult,tabs,m_tab_index,field_x,y,field_w,1000.0,0.0,0.1,2,"1.0",card_back,field_border))
         return(false);

      const int ind_x=content_pad+(card_w+card_gap)*3;
      if(!V2CreateCard(*m_host,m_card_indicador,tabs,m_window_index,m_tab_index,ind_x,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_indicador_title,"Take profit (indicador)",m_card_indicador,tabs,m_window_index,m_tab_index,16,12,field_w))
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
      if(!V2CreateFieldLabel(*m_host,m_indicador_trigger_label,"Distancia para disparo",m_card_indicador,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateSpinControl(m_indicador_trigger_spin,m_card_indicador,tabs,m_tab_index,field_x,y,field_w,100000.0,0.0,1.0,1,"0.0",card_back,field_border))
         return(false);
      y+=34;
      if(!V2CreateFieldLabel(*m_host,m_indicador_tipo_label,"Indicador",m_card_indicador,tabs,m_window_index,m_tab_index,field_x,y,field_w,18))
         return(false);
      y+=22;
      if(!CreateComboControl(m_indicador_combo,m_card_indicador,tabs,m_tab_index,field_x,y,field_w,80,indicador_items,0,field_border))
         return(false);

      m_calc_tabs.SelectTab(0);
      m_calc_tabs.ShowTabElements();
      m_created=true;
      return(true);
     }

   void Load()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_take=(m_settings.take_profit==CONSTRUTOR_SIM) || (m_settings.take_fixo==CONSTRUTOR_SIM) || (m_settings.take_calculo==CONSTRUTOR_SIM) || (m_settings.take_indicador==CONSTRUTOR_SIM);
      const bool use_indic=(use_take && m_settings.take_indicador==CONSTRUTOR_SIM);
      const bool use_mult=(use_take && !use_indic && m_settings.take_calculo_multiplicar==CONSTRUTOR_SIM);
      const bool use_calc=(use_take && !use_indic && !use_mult && m_settings.take_calculo==CONSTRUTOR_SIM);
      const bool use_fixed=(use_take && !use_indic && !use_mult && !use_calc && m_settings.take_fixo==CONSTRUTOR_SIM);

      m_use_fixed.IsPressed(use_fixed);
      m_use_calc.IsPressed(use_calc);
      m_use_mult.IsPressed(use_mult);
      m_use_indicador.IsPressed(use_indic);
      m_type_combo.SelectItem(V2ClampIndex((int)m_settings.tipo_take_profit,0,1));
      m_fixed_dist_spin.SetValue(DoubleToString(m_settings.take_fixo_distancia>0.0 ? m_settings.take_fixo_distancia : 100.0,1));
      m_calc_ref_check.IsPressed(m_settings.take_calculo_referencia==CONSTRUTOR_SIM);
      m_calc_media_check.IsPressed(m_settings.take_calculo_media==CONSTRUTOR_SIM);
      m_calc_maxmin_check.IsPressed(m_settings.take_calculo_maxmin==CONSTRUTOR_SIM);
      m_calc_maxmin_base_combo.SelectItem(V2ClampIndex((int)m_settings.take_calculo_maxmin_base,0,3));
      m_calc_maxmin_count_spin.SetValue(IntegerToString(m_settings.take_calculo_maxmin_ultimos>0 ? m_settings.take_calculo_maxmin_ultimos : 3));
      m_calc_ref_base_combo.SelectItem(V2ClampIndex((int)m_settings.take_calculo_referencia_base,0,3));
      m_calc_ref_candle_combo.SelectItem(V2ClampIndex((int)m_settings.take_calculo_referencia_posicao,0,3));
      m_calc_ref_distance_spin.SetValue(DoubleToString(m_settings.take_calculo_referencia_distancia,1));
      m_calc_ref_expire_combo.SelectItem(V2ClampIndex(m_settings.take_calculo_referencia_expirar,0,4));
      m_calc_media_candles_spin.SetValue(IntegerToString(m_settings.take_calculo_media_qtd_candles>0 ? m_settings.take_calculo_media_qtd_candles : 3));
      m_calc_media_base_combo.SelectItem(V2ClampIndex((int)m_settings.take_calculo_media_base,0,3));
      m_calc_media_distance_spin.SetValue(DoubleToString(m_settings.take_calculo_media_distancia,1));
      m_calc_media_expire_combo.SelectItem(V2ClampIndex(m_settings.take_calculo_media_expirar,0,4));
      m_mult_base_combo.SelectItem(V2ClampIndex((int)m_settings.take_calculo_multiplicar_base,0,1));
      m_mult_candle_combo.SelectItem(V2ClampIndex(m_settings.take_calculo_multiplicar_candle>=0 ? m_settings.take_calculo_multiplicar_candle : 2,0,3));
      m_mult_qty_spin.SetValue(DoubleToString(m_settings.take_calculo_multiplicar_qtd>0.0 ? m_settings.take_calculo_multiplicar_qtd : 1.0,2));
      m_indicador_trigger_spin.SetValue(DoubleToString(m_settings.take_indicador_distancia_disparo>=0.0 ? m_settings.take_indicador_distancia_disparo : 0.0,1));

      int indicador_index=0;
      if(m_settings.take_indicador_tipo==CONSTRUTOR_STOP_IND_PARABOLIC_SAR)
         indicador_index=1;
      m_indicador_combo.SelectItem(indicador_index);
     }

   void Save()
     {
      if(!m_has_settings || !m_created)
         return;

      const bool use_indic=m_use_indicador.IsPressed();
      const bool use_mult=(!use_indic && m_use_mult.IsPressed());
      const bool use_calc=(!use_indic && !use_mult && m_use_calc.IsPressed());
      const bool use_fixed=(!use_indic && !use_mult && !use_calc && m_use_fixed.IsPressed());

      m_settings.take_profit=((use_fixed || use_calc || use_mult || use_indic) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.tipo_take_profit=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)V2ClampIndex(m_type_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.take_fixo=(use_fixed ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_calculo=((use_calc || use_mult) ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_calculo_multiplicar=(use_mult ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_indicador=(use_indic ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_fixo_distancia=StringToDouble(m_fixed_dist_spin.GetValue());
      m_settings.take_calculo_referencia=(m_calc_ref_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_calculo_media=(m_calc_media_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_calculo_maxmin=(m_calc_maxmin_check.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.take_calculo_maxmin_base=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_calc_maxmin_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.take_calculo_maxmin_ultimos=(int)StringToInteger(m_calc_maxmin_count_spin.GetValue());
      m_settings.take_calculo_referencia_base=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_calc_ref_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.take_calculo_referencia_posicao=(ENUM_CONSTRUTOR_POSICAO_REFERENCIA)V2ClampIndex(m_calc_ref_candle_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.take_calculo_media_qtd_candles=(int)StringToInteger(m_calc_media_candles_spin.GetValue());
      m_settings.take_calculo_media_base=(ENUM_CONSTRUTOR_BASE_MEDIA)V2ClampIndex(m_calc_media_base_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.take_calculo_referencia_distancia=StringToDouble(m_calc_ref_distance_spin.GetValue());
      m_settings.take_calculo_referencia_expirar=V2ClampIndex(m_calc_ref_expire_combo.GetListViewPointer().SelectedItemIndex(),0,4);
      m_settings.take_calculo_media_distancia=StringToDouble(m_calc_media_distance_spin.GetValue());
      m_settings.take_calculo_media_expirar=V2ClampIndex(m_calc_media_expire_combo.GetListViewPointer().SelectedItemIndex(),0,4);
      m_settings.take_calculo_multiplicar_base=(ENUM_CONSTRUTOR_BASE_MULTIPLICAR)V2ClampIndex(m_mult_base_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.take_calculo_multiplicar_candle=V2ClampIndex(m_mult_candle_combo.GetListViewPointer().SelectedItemIndex(),0,3);
      m_settings.take_calculo_multiplicar_qtd=StringToDouble(m_mult_qty_spin.GetValue());
      m_settings.take_indicador_distancia_disparo=StringToDouble(m_indicador_trigger_spin.GetValue());
      m_settings.take_indicador_tipo=(m_indicador_combo.GetListViewPointer().SelectedItemIndex()==1 ? CONSTRUTOR_STOP_IND_PARABOLIC_SAR : CONSTRUTOR_STOP_IND_MEDIA_MOVEL);
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      if(!m_created)
         return(false);
      if(id!=CHARTEVENT_CUSTOM+ON_CLICK_CHECKBOX)
         return(false);

      const int clicked_id=(int)lparam;
      if(m_use_fixed.Id()==clicked_id)
        {
         if(m_use_fixed.IsPressed())
           {
            m_use_calc.IsPressed(false);
            m_use_mult.IsPressed(false);
            m_use_indicador.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      if(m_use_calc.Id()==clicked_id)
        {
         if(m_use_calc.IsPressed())
           {
            m_use_fixed.IsPressed(false);
            m_use_mult.IsPressed(false);
            m_use_indicador.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      if(m_use_mult.Id()==clicked_id)
        {
         if(m_use_mult.IsPressed())
           {
            m_use_fixed.IsPressed(false);
            m_use_calc.IsPressed(false);
            m_use_indicador.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      if(m_use_indicador.Id()==clicked_id)
        {
         if(m_use_indicador.IsPressed())
           {
            m_use_fixed.IsPressed(false);
            m_use_calc.IsPressed(false);
            m_use_mult.IsPressed(false);
           }
         RefreshModeChecks();
         return(true);
        }
      if(m_calc_ref_check.Id()==clicked_id)
        {
         if(m_calc_ref_check.IsPressed())
           {
            m_calc_media_check.IsPressed(false);
            m_calc_maxmin_check.IsPressed(false);
           }
         RefreshCalcChecks();
         return(true);
        }
      if(m_calc_media_check.Id()==clicked_id)
        {
         if(m_calc_media_check.IsPressed())
           {
            m_calc_ref_check.IsPressed(false);
            m_calc_maxmin_check.IsPressed(false);
           }
         RefreshCalcChecks();
         return(true);
        }
      if(m_calc_maxmin_check.Id()==clicked_id)
        {
         if(m_calc_maxmin_check.IsPressed())
           {
            m_calc_ref_check.IsPressed(false);
            m_calc_media_check.IsPressed(false);
           }
         RefreshCalcChecks();
         return(true);
        }
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB4_TAKE_PROFIT_MQH__
