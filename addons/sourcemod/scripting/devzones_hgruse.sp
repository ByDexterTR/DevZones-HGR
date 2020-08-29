// ------ #include ------ //

#include <sourcemod>
#include <devzones>
#include <multicolors>
#include <hgr>

// ------ int ------ //

int Hgruse[MAXPLAYERS + 1];

// ------ #pragma ------ //

#pragma semicolon 1
#pragma newdecls required

// ------ myinfo ------ //

public Plugin myinfo = 
{
	name = "SM DEV ZONES - HGR Use",
	author = "ByDexter",
	description = "",
	version = "1.0",
	url = "https://steamcommunity.com/id/ByDexterTR/"
};

public void OnClientDisconnect(int client)
{
	if (Hgruse[client] == 1)
	{
		Hgruse[client] = 0;
	}
}

public void Zone_OnClientEntry(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "hgruse", false) == 0)
	{
		Hgruse[client] = 1;
		CPrintToChat(client, "{darkred}[ByDexter] {green}hgruse Bölgesine {default}girdiniz.");
	}
}

public void Zone_OnClientLeave(int client, const char[] zone)
{
	if(client < 1 || client > MaxClients || !IsClientInGame(client) ||!IsPlayerAlive(client)) 
		return;
		
	if(StrContains(zone, "hgruse", false) == 0)
	{
		Hgruse[client] = 0;
		CPrintToChat(client, "{darkred}[ByDexter] {green}hgruse Bölgesinden {default}ayrıldınız.");
	}
}

public Action HGR_OnClientHook(int client)
{
	if (Hgruse[client] == 1)
	{
		return Plugin_Continue;
	}
	CPrintToChat(client, "{darkred}[ByDexter] {green}hgruse bölgesi dışı {default}hook kullanamazsın");
	return Plugin_Handled;
}

public Action HGR_OnClientGrab(int client)
{
	if (Hgruse[client] == 1)
	{
		return Plugin_Continue;
	}
	CPrintToChat(client, "{darkred}[ByDexter] {green}hgruse bölgesi dışı {default}grab kullanamazsın");
	return Plugin_Handled;
}

public Action HGR_OnClientRope(int client)
{
	if (Hgruse[client] == 1)
	{
		return Plugin_Continue;
	}
	CPrintToChat(client, "{darkred}[ByDexter] {green}hgruse bölgesi dışı {default}rope kullanamazsın");
	return Plugin_Handled;
}