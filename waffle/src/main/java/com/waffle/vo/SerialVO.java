package com.waffle.vo;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Component;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
	@Component
	public class SerialVO{
	
    public SerialVO()
    {
        super();
    }    
    public void connect ( String portName , AduVO aduVO ) throws Exception
    {
    
        CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);
    
        if ( portIdentifier.isCurrentlyOwned() )
        {
            System.out.println("Error: Port is currently in use");
        
        }
        else
        {

        	
            CommPort commPort = portIdentifier.open(this.getClass().getName(),2000);
            
            if ( commPort instanceof SerialPort )
            {
                
                SerialPort serialPort = (SerialPort) commPort;
                serialPort.setSerialPortParams(9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
                
                
                InputStream in = serialPort.getInputStream();
                OutputStream out = serialPort.getOutputStream();
                
                 //�б�, ���� ������ �۵�
                (new Thread(new SerialReader(in, aduVO))).start();
                (new Thread(new SerialWriter(out))).start();

            }
            else
            {
                System.out.println("Error: Only serial ports are handled by this example.");
            }
        }     
    }
    
    public class SerialReader implements Runnable 
    {	
    	InputStream in;
		
    	private AduVO aduVO;
        public SerialReader (InputStream in ,AduVO aduVO)
        {
        	this.in =in;
        	this.aduVO=aduVO;
        }

        @Override
        public void run ()
        {
            byte[] buffer = new byte[1024];
            int len = -1;
            String rstr="";
            
            try
            {
                while ( ( len = this.in.read(buffer)) > -1 )
                {
    				/*
    				 * System.out.print(new String(buffer,0,len)); //System.out.println(len);
    				 */
                    if(len == 0) continue;
                    else {
                    	String str = new String(buffer,0,len);
                    	if(str.contains("#")) {
                    		rstr+=str;
                    		rstr = rstr.substring(0, rstr.length()-1);
                    		aduVO.setTemp(rstr);
                    		
                            rstr="";
                    	}
                    	else if(str.contains("@")) {
                    		rstr+=str;
                    		rstr = rstr.substring(0, rstr.length()-1);
                    		aduVO.setWet(rstr);
                    		
                            rstr="";
                    	}
                    	else
                    	{
                    		rstr+=str;
                    	}
                    }
                    
                }
            }
            catch ( IOException e )
            {
                e.printStackTrace();
            }            
        }
    }

  
    /** */
    //������ �۽�
    public static class SerialWriter implements Runnable 
    {
        OutputStream out;
        
        public SerialWriter ( OutputStream out )
        {
            this.out = out;
        }
        
        public void run ()
        {
        	
        /*    try
            {
            	
            		
                //while ( ( c = System.in.read()) > -1 )
                while(true)
                {
                
                }                
            }
            catch ( IOException e )
            {
                e.printStackTrace();
            }            
        }*/
        }
    }
}