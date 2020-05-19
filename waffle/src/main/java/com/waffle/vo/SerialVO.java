package com.waffle.vo;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Component;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

@Component
public class SerialVO {
	String check = ""; 
	InputStream in;
	OutputStream out;
	public SerialVO() {
		super();
	
	}
	//자바와 아두이노 skech프로그램 시리얼 통신 
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
				 * if(checkinout.equals("in")) { read(roomVO,checkinout,in); } else
				 * if(checkinout.equals("out")) { write(roomVO,checkinout,out);}
				 */
				 
			} 
			else {
				System.out.println("Error: Only serial ports are handled by this example.");
			}
		}
	}
	//온습도 센서값을 읽어오는 쓰레드 실행 메소드
	public void read(RoomVO roomVO) {
		System.out.println("리드"+in);
		System.out.println("in메소드 실행");
		SerialReader sr = new SerialReader(in,roomVO);
		Thread srth = new Thread(sr);
		srth.start();
		srth.interrupt(); //정지요청

	}
	//조명,티비,에어컨,창문의 db값을 읽어 아두이노로 보내주는 쓰레드 실행 메소드
	public void write(RoomVO roomVO ,String function) {
		System.out.println("out메소드 실행");
		SerialWriter sr = new SerialWriter(out,roomVO,function);
		Thread srth = new Thread(sr);
		srth.start();
		srth.interrupt(); //정지요청
	}
	//컨트롤러가 실행되는동안 쓰레드를 잠시 지연시켜주는 메소드 -> 1000 = 1초
	public void timesleep(int delayTime) {
			long saveTime = System.currentTimeMillis();
			long currTime= 0;
			while(currTime - saveTime < delayTime) {
				currTime=System.currentTimeMillis();
			}
	}
	//온습도값을 읽어오는 스레드
	public class SerialReader implements Runnable {
		InputStream in;
		SerialVO serialvo;
		private RoomVO roomVO;

		public SerialReader(InputStream in, RoomVO roomVO) {
			this.in = in;
			this.roomVO = roomVO;
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
							roomVO.setInnerTemp(rstr);
							rstr = "";
							System.out.println("온도 ");
						} else if (str.contains("@")) {
							rstr += str;
							rstr = rstr.substring(0,rstr.indexOf("@"));
							System.out.println(rstr);
							roomVO.setInnerWet(rstr);
							rstr = "";
							System.out.println("습도");
							Thread.sleep(1); //정지하기위한 딜레이 -> InterruptedException으로 이동
							
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
		//조명 창문 에어컨 tv 스레드 
		public static class SerialWriter implements Runnable {
			OutputStream out;
			private RoomVO roomVO;
			private String function;
	
			public SerialWriter(OutputStream out, RoomVO roomVO,String function) {
				this.out = out;
				this.roomVO = roomVO;
				this.function = function;
			}
	
			public void run() {
				System.out.println("run메소드 진입");
				try {
					if(function == "light") {
					int c = Integer.parseInt(roomVO.getLight());
					while (true) {
						System.out.println(c + "입력");
						this.out.write(c);
						Thread.sleep(1000); //정지하기위한 딜레이 -> InterruptedException으로 이동
					}
					}
					else if(function =="tv") {
						System.out.println("tv로 진입");
						int c = Integer.parseInt(roomVO.getTv());
						while (true) {
							System.out.println(c + "입력");
							this.out.write(c+2);
							Thread.sleep(1000); //정지하기위한 딜레이 -> InterruptedException으로 이동
						}
					}
					else if(function =="air") {
						System.out.println("air로 진입");
						int c = Integer.parseInt(roomVO.getAircon());
						while (true) {
							System.out.println(c + "입력");
							this.out.write(c+4);
							Thread.sleep(1000); //정지하기위한 딜레이 -> InterruptedException으로 이동
						}
					}
					else if(function =="window") {
						System.out.println("window으로 진입");
						int c = Integer.parseInt(roomVO.getWindow());
						while (true) {
							System.out.println(c + "입력");
							this.out.write(c+6);
							Thread.sleep(1000); //정지하기위한 딜레이 -> InterruptedException으로 이동
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
