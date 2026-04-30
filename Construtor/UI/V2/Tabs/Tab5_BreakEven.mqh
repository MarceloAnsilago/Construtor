#ifndef __CONSTRUTOR_V2_TAB5_BREAK_EVEN_MQH__
#define __CONSTRUTOR_V2_TAB5_BREAK_EVEN_MQH__

#include "..\\V2Shared.mqh"

class CTab5BreakEvenV2 : public CEF_CWndCreate
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
   CEF_CFrame           m_card;
   CEF_CTextLabel       m_card_title;
   CEF_CCheckBox        m_use_break_even;
   CEF_CTextLabel       m_inicio_label;
   CEF_CTextEdit        m_inicio_spin;
   CEF_CTextLabel       m_dist_label;
   CEF_CTextEdit        m_dist_spin;

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

public:
                     CTab5BreakEvenV2(void) : m_host(NULL), m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

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
      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color field_border=V2_COLOR_FIELD_BORDER;

      if(!V2CreateFieldLabel(*m_host,m_type_label,"Padrao",tabs,tabs,m_window_index,m_tab_index,content_pad,type_y,260,18))
         return(false);
      string type_items[];
      V2ItemsStopTipo(type_items);
      if(!CreateComboControl(m_type_combo,tabs,tabs,m_tab_index,content_pad,type_y+22,260,80,type_items,0,field_border))
         return(false);

      if(!V2CreateCard(*m_host,m_card,tabs,m_window_index,m_tab_index,content_pad,content_y,card_w,card_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_title,"Break even",m_card,tabs,m_window_index,m_tab_index,16,12,field_w))
         return(false);
      if(!m_host.CreateCheckbox(m_use_break_even,"Ativar break even",m_card,m_window_index,tabs,m_tab_index,16,44,field_w,false,false,false))
         return(false);
      m_use_break_even.FontSize(10);
      m_use_break_even.LabelColor(V2_COLOR_TEXT_PRIMARY);

      if(!V2CreateFieldLabel(*m_host,m_inicio_label,"Inicio",m_card,tabs,m_window_index,m_tab_index,field_x,76,field_w,18))
         return(false);
      if(!CreateSpinControl(m_inicio_spin,m_card,tabs,m_tab_index,field_x,98,field_w,100000.0,0.0,1.0,1,"0.0",card_back,field_border))
         return(false);

      if(!V2CreateFieldLabel(*m_host,m_dist_label,"Distancia",m_card,tabs,m_window_index,m_tab_index,field_x,132,field_w,18))
         return(false);
      if(!CreateSpinControl(m_dist_spin,m_card,tabs,m_tab_index,field_x,154,field_w,100000.0,0.0,1.0,1,"100.0",card_back,field_border))
         return(false);

      m_created=true;
      return(true);
     }

   void Load()
     {
      if(!m_has_settings || !m_created)
         return;

      m_use_break_even.IsPressed(m_settings.break_even==CONSTRUTOR_SIM);
      m_type_combo.SelectItem(V2ClampIndex((int)m_settings.tipo_break_even,0,1));
      m_inicio_spin.SetValue(DoubleToString(m_settings.break_even_inicio>=0.0 ? m_settings.break_even_inicio : 0.0,1));
      m_dist_spin.SetValue(DoubleToString(m_settings.break_even_distancia>0.0 ? m_settings.break_even_distancia : 100.0,1));
     }

   void Save()
     {
      if(!m_has_settings || !m_created)
         return;

      m_settings.break_even=(m_use_break_even.IsPressed() ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
      m_settings.tipo_break_even=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)V2ClampIndex(m_type_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      m_settings.break_even_inicio=StringToDouble(m_inicio_spin.GetValue());
      m_settings.break_even_distancia=StringToDouble(m_dist_spin.GetValue());
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB5_BREAK_EVEN_MQH__
