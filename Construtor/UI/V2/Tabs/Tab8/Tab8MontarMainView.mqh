#ifndef __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__
#define __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__

#include "Tab8Shared.mqh"
#include "Tab8MontarSlotCard.mqh"

class CTab8MontarMainView : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate        *m_host;
   bool                   m_created;
   int                    m_window_index;
   int                    m_tab_index;

   CTab8MontarSlotCard    m_slots[4];
   CEF_CFrame             m_logic_card;
   CEF_CTextLabel         m_logic_title;
   CEF_CTextLabel         m_logic_note;
   CEF_CTextLabel         m_logic_cols[6];
   CEF_CTextLabel         m_logic_rows[5];

public:
                        CTab8MontarMainView(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1) {}

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int tabs_h=tabs.YSize();
      const int content_pad=18;
      const int content_y=40;
      const int content_w=tabs_w-(content_pad*2);
      const int gap=10;
      const int slot_w=(content_w-(gap*3))/4;
      const int available_h=tabs_h-content_y-18;
      const int slot_h=(available_h-12)/2;
      const int logic_y=content_y+slot_h+gap;
      const int logic_h=available_h-slot_h-gap;

      for(int slot=0;slot<4;slot++)
        {
         const int slot_x=content_pad+(slot_w+gap)*slot;
         if(!m_slots[slot].Create(*m_host,m_window_index,tabs,m_tab_index,slot,slot_x,content_y,slot_w,slot_h))
            return(false);
        }

      if(!V2CreateCard(*m_host,m_logic_card,tabs,m_window_index,m_tab_index,content_pad,logic_y,content_w,logic_h,V2_COLOR_CARD_BACK,V2_COLOR_CARD_BORDER))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_logic_title,"Composicao logica dos sinais",m_logic_card,tabs,m_window_index,m_tab_index,16,12,content_w-32))
         return(false);
      if(!m_host.CreateTextLabel(m_logic_note,"Este bloco permanece separado. Ele recebe a montagem final usando os 4 slots acima, cada um podendo ficar em Nao usar.",m_logic_card,m_window_index,tabs,m_tab_index,16,40,content_w-32,20))
         return(false);
      m_logic_note.FontSize(10);
      m_logic_note.LabelColor(V2_COLOR_TEXT_SECONDARY);

      string col_titles[];
      ArrayResize(col_titles,6);
      col_titles[0]="Operador";
      col_titles[1]="Velas";
      col_titles[2]="Valor ref.";
      col_titles[3]="Comparacao";
      col_titles[4]="Valor comp.";
      col_titles[5]="Velas comp.";

      const int table_x=16;
      const int table_y=78;
      const int table_w=content_w-32;
      const int col_gap=8;
      const int col_w=(table_w-(col_gap*5))/6;

      for(int i=0;i<6;i++)
        {
         const int x=table_x+(col_w+col_gap)*i;
         if(!V2CreateFieldLabel(*m_host,m_logic_cols[i],col_titles[i],m_logic_card,tabs,m_window_index,m_tab_index,x,table_y,col_w,16))
            return(false);
        }

      for(int i=0;i<5;i++)
        {
         const string row_text=StringFormat("Linha %d: aguardando migracao da logica do V1.",i+1);
         if(!m_host.CreateTextLabel(m_logic_rows[i],row_text,m_logic_card,m_window_index,tabs,m_tab_index,16,table_y+28+(i*28),table_w,18))
            return(false);
         m_logic_rows[i].FontSize(10);
         m_logic_rows[i].LabelColor(V2_COLOR_TEXT_SECONDARY);
        }

      m_created=true;
      return(true);
     }

   void OnTimerEvent(void)
     {
      if(!m_created)
         return;

      for(int i=0;i<4;i++)
         m_slots[i].OnTimerEvent();
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__
