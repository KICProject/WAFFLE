package com.waffle.vo;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.stereotype.Component;

import com.sun.xml.internal.messaging.saaj.util.TeeInputStream;
import com.sun.xml.internal.ws.wsdl.writer.document.Port;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import oracle.security.o3logon.b;

@Component
public class SerialVO {
	String check = ""; 
	InputStream in;
	OutputStream out;
	public SerialVO() {
		super();
	
	}

	public void connect(String portName) throws Exception {

		CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);

		if (portIdentifier.isCurrentlyOwned()) {
	
			System.out.println("Error: Port is currently in use");

		} else {

			CommPort commPort = portIdentifier.open(this.getClass().getName(), 2000);

			if (commPort instanceof SerialPort) {

				SerialPort serialPort = (SerialPort) commPort;
				serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);

				in = serialPort.getInputStream();
				out = serialPort.getOutputStream();
				System.out.println("Serial의 in"+ in);
			
				
				
				/*
				 * if(checkinout.equals("in")) { read(aduVO,checkinout,in); } else
				 * if(checkinout.equals("out")) { write(aduVO,checkinout,out);}
				 */
				 
			} 
			else {
				System.out.println("Error: Only serial ports are handled by this example.");
			}
		}
	}
	public void read(AduVO aduVO) {
		System.out.println("리드"+in);
		System.out.println("in메소드 실행");
		SerialReader sr = new SerialReader(in,aduVO);
		Thread srth = new Thread(sr);
		srth.start();
		srth.interrupt();

	}
	public void write(AduVO aduVO ,String function) {
		System.out.println("out메소드 실행");
		SerialWriter sr = new SerialWriter(out,aduVO,function);
		Thread srth = new Thread(sr);
		srth.start();
		srth.interrupt();
	}
	public void timesleep(int delayTime) {
			long saveTime = System.currentTimeMillis();
			long currTime=0;
			while(currTime - saveTime < delayTime) {
				currTime=System.currentTimeMillis();
			}
	}

	public class SerialReader implements Runnable {
		InputStream in;
		SerialVO serialvo;
		private AduVO aduVO;

		public SerialReader(InputStream in, AduVO aduVO) {
			this.in = in;
			this.aduVO = aduVO;
		}

		@Override
		public void run() {
			byte[] buffer = new byte[1024];
			int len = -1;
			String rstr = "";
			System.out.println("Run진입");
			try {
				while ((len = this.in.read(buffer)) > -1) {
					
					// System.out.print(new String(buffer,0,len)); //System.out.println(len);
				
					if (len == 0) {
						continue;
					}
					else { 
						String str = new String(buffer, 0, len);
						if (str.contains("#")) {	
							rstr += str;
							rstr = rstr.substring(0,rstr.indexOf("#"));
							System.out.println(rstr);
							aduVO.setTemp(rstr);
							rstr = "";
							System.out.println("온도 ");
						} else if (str.contains("@")) {
							rstr += str;
							rstr = rstr.substring(0,rstr.indexOf("@"));
							System.out.println(rstr);
							aduVO.setWet(rstr);
							rstr = "";
							System.out.println("습도");
							Thread.sleep(1);
							
						}

						else {
							rstr += str;
						
						}
						
					}
				}
				
			}catch(InterruptedException e) {rstr=""; System.out.println("스레드 종료");}
			 catch(IOException e) {e.printStackTrace();}
			}
			
		}	


		public static class SerialWriter implements Runnable {
			OutputStream out;
			private AduVO aduVO;
			private String function;
	
			public SerialWriter(OutputStream out, AduVO aduVO,String function) {
				this.out = out;
				this.aduVO = aduVO;
				this.function = function;
			}
	
			public void run() {
				System.out.println("run메소드 진입");
				try {
					if(function == "light") {
					int c = Integer.parseInt(aduVO.getLight());
					while (true) {
						System.out.println(c + "입력");
						this.out.write(c);
						Thread.sleep(1000);
					}
					}
					else if(function =="tv") {
						System.out.println("tv로 진입");
						int c = Integer.parseInt(aduVO.getTv());
						while (true) {
							System.out.println(c + "입력");
							this.out.write(c+2);
							Thread.sleep(1000);
						}
					}
					else if(function =="air") {
						System.out.println("air로 진입");
						int c = Integer.parseInt(aduVO.getAircon());
						while (true) {
							System.out.println(c + "입력");
							this.out.write(c+4);
							Thread.sleep(1000);
						}
					}
					else if(function =="window") {
						System.out.println("window으로 진입");
						int c = Integer.parseInt(aduVO.getWindow());
						while (true) {
							System.out.println(c + "입력");
							this.out.write(c+6);
							Thread.sleep(1000);
						}
					}
					
				}catch (InterruptedException e) {
						System.out.println("스레드종료");
					
				} catch (Exception e) {
					e.printStackTrace();
				}
	
			}
		}
	}
