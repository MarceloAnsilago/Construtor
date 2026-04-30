#ifndef __CONSTRUTOR_V2_TAB7_SAIDAS_PARCIAIS_MQH__
#define __CONSTRUTOR_V2_TAB7_SAIDAS_PARCIAIS_MQH__

#include "..\\V2Shared.mqh"

class CTab7SaidasParciaisV2 : public CEF_CWndCreate
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
   CEF_CFrame           m_cards[6];
   CEF_CTextLabel       m_card_titles[6];
   CEF_CCheckBox        m_use_saida[6];
   CEF_CTextLabel       m_dist_labels[6];
   CEF_CTextEdit        m_dist_spins[6];
   CEF_CTextLabel       m_qty_labels[6];
   CEF_CTextEdit        m_qty_spins[6];

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
                     CTab7SaidasParciaisV2(void) : m_host(NULL), m_has_settings(false), m_created(false), m_window_index(-1), m_tab_index(-1) {}

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
      const int card_gap=10;
      const int cols=3;
      const int card_w=(content_w-(card_gap*(cols-1)))/cols;
      const int card_h=200;
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

      for(int i=0;i<6;i++)
        {
         const int col=i%cols;
         const int row=i/cols;
         const int x=content_pad+col*(card_w+card_gap);
         const int y=content_y+row*(card_h+card_gap);

         if(!V2CreateCard(*m_host,m_cards[i],tabs,m_window_index,m_tab_index,x,y,card_w,card_h,card_back,card_border))
            return(false);

         string title=StringFormat("Saida %d",i+1);
         if(!V2CreateCardTitle(*m_host,m_card_titles[i],title,m_cards[i],tabs,m_window_index,m_tab_index,16,10,field_w))
            return(false);

         string check_text=StringFormat("Ativar saida %d",i+1);
         if(!m_host.CreateCheckbox(m_use_saida[i],check_text,m_cards[i],m_window_index,tabs,m_tab_index,16,34,field_w,false,false,false))
            return(false);
         m_use_saida[i].FontSize(9);
         m_use_saida[i].LabelColor(V2_COLOR_TEXT_PRIMARY);

         if(!V2CreateFieldLabel(*m_host,m_dist_labels[i],"Distancia",m_cards[i],tabs,m_window_index,m_tab_index,16,58,field_w,16))
            return(false);
         m_dist_labels[i].FontSize(9);
         if(!CreateSpinControl(m_dist_spins[i],m_cards[i],tabs,m_tab_index,16,76,field_w,100000.0,0.0,1.0,1,"0.0",card_back,field_border))
            return(false);

         if(!V2CreateFieldLabel(*m_host,m_qty_labels[i],"Quantidade",m_cards[i],tabs,m_window_index,m_tab_index,16,108,field_w,16))
            return(false);
         m_qty_labels[i].FontSize(9);
         if(!CreateSpinControl(m_qty_spins[i],m_cards[i],tabs,m_tab_index,16,126,field_w,100000.0,0.0,1.0,2,"0.0",card_back,field_border))
            return(false);
        }

      m_created=true;
      return(true);
     }

   void Load()
     {
      if(!m_has_settings || !m_created)
         return;

      m_type_combo.SelectItem(V2ClampIndex((int)m_settings.tipo_saida_parcial,0,1));
      for(int i=0;i<6;i++)
        {
         const double dist=m_settings.saida_parcial_distancia[i];
         const double qty=m_settings.saida_parcial_valor[i];
         m_use_saida[i].IsPressed((dist>0.0 || qty>0.0));
         m_dist_spins[i].SetValue(DoubleToString(dist>=0.0 ? dist : 0.0,1));
         m_qty_spins[i].SetValue(DoubleToString(qty>=0.0 ? qty : 0.0,2));
        }
     }

   void Save()
     {
      if(!m_has_settings || !m_created)
         return;

      m_settings.tipo_saida_parcial=(ENUM_CONSTRUTOR_TIPO_STOP_LOSS)V2ClampIndex(m_type_combo.GetListViewPointer().SelectedItemIndex(),0,1);
      bool has_any=false;
      for(int i=0;i<6;i++)
        {
         const bool enabled=m_use_saida[i].IsPressed();
         const double dist=(enabled ? StringToDouble(m_dist_spins[i].GetValue()) : 0.0);
         const double qty=(enabled ? StringToDouble(m_qty_spins[i].GetValue()) : 0.0);
         m_settings.saida_parcial_distancia[i]=dist;
         m_settings.saida_parcial_valor[i]=qty;
         if(enabled && (dist>0.0 || qty>0.0))
            has_any=true;
        }
      m_settings.saida_parcial=(has_any ? CONSTRUTOR_SIM : CONSTRUTOR_NAO);
     }

   bool HandleEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
     {
      return(false);
     }
  };

#endif // __CONSTRUTOR_V2_TAB7_SAIDAS_PARCIAIS_MQH__
