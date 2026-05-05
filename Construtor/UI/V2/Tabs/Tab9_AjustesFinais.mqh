#ifndef __CONSTRUTOR_V2_TAB9_AJUSTES_FINAIS_MQH__
#define __CONSTRUTOR_V2_TAB9_AJUSTES_FINAIS_MQH__

#include "..\\V2Shared.mqh"

class CTab9AjustesFinaisV2 : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate *m_host;
   bool            m_created;
   int             m_window_index;
   int             m_tab_index;

   CEF_CFrame      m_card;
   CEF_CTextLabel  m_card_title;
   CEF_CTextLabel  m_option_labels[9];
   CEF_CComboBox   m_option_combos[9];

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

public:
                     CTab9AjustesFinaisV2(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1) {}

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int content_pad=24;
      const int content_y=78;
      const int content_w=tabs.XSize()-(content_pad*2);
      const int content_h=tabs.YSize()-content_y-24;
      const int row_x=18;
      const int row_w=content_w-36;
      const int combo_w=116;
      const int label_w=row_w-combo_w-12;
      const int combo_x=row_x+label_w+12;
      const int row_start_y=44;
      const int row_step=34;
      const color card_back=V2_COLOR_CARD_BACK;
      const color card_border=V2_COLOR_CARD_BORDER;
      const color field_border=V2_COLOR_FIELD_BORDER;

      if(!V2CreateCard(*m_host,m_card,tabs,m_window_index,m_tab_index,content_pad,content_y,content_w,content_h,card_back,card_border))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_card_title,"AJUSTES FINAIS",m_card,tabs,m_window_index,m_tab_index,16,12,content_w-32))
         return(false);

      string yes_no_items[];
      ArrayResize(yes_no_items,2);
      yes_no_items[0]="Nao";
      yes_no_items[1]="Sim";

      string option_texts[];
      ArrayResize(option_texts,9);
      option_texts[0]="Cancelar pendente de entrada se aparecer sinal oposto";
      option_texts[1]="Reposicionar stoploss no aumento a favor da operacao";
      option_texts[2]="Reposicionar takeprofit no aumento contra a operacao";
      option_texts[3]="Movimentar stoploss com base no preco medio";
      option_texts[4]="Movimentar takeprofit com base no preco medio";
      option_texts[5]="Usar preco medio como referencia das parciais";
      option_texts[6]="Impedir sinal de saida na vela que gerou entrada";
      option_texts[7]="Impedir sinal de entrada na vela que gerou saida";
      option_texts[8]="Recalcular o preco medio com base nas saidas parciais";

      for(int i=0;i<9;i++)
        {
         const int y=content_y+row_start_y+(i*row_step);
         const int abs_x=content_pad+row_x;
         const int abs_combo_x=content_pad+combo_x;
         if(!V2CreateFieldLabel(*m_host,m_option_labels[i],option_texts[i],tabs,tabs,m_window_index,m_tab_index,abs_x,y,label_w,18))
            return(false);
         m_option_labels[i].FontSize(10);
         m_option_labels[i].LabelColor(V2_COLOR_TEXT_PRIMARY);

         if(!CreateComboControl(m_option_combos[i],tabs,tabs,m_tab_index,abs_combo_x,y-2,combo_w,70,yes_no_items,0,field_border))
            return(false);
        }

      m_created=true;
      return(true);
     }
  };

#endif // __CONSTRUTOR_V2_TAB9_AJUSTES_FINAIS_MQH__
