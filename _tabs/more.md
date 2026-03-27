---
# the default layout is 'page'
icon: fas fa-info-circle
order: 5
---

<style>
	#more-gallery {
		column-count: 1;
		column-gap: 1rem;
	}

	@media (min-width: 768px) {
		#more-gallery {
			column-count: 2;
		}
	}

	@media (min-width: 1200px) {
		#more-gallery {
			column-count: 3;
		}
	}

	#more-gallery .photo-card {
		break-inside: avoid;
		margin: 0 0 1rem;
		border-radius: 0.75rem;
		overflow: hidden;
		background: var(--card-bg);
		border: 1px solid var(--main-border-color);
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
	}

	#more-gallery img {
		display: block;
		width: 100%;
		height: auto;
	}

	#more-gallery figcaption {
		padding: 0.55rem 0.8rem;
		color: var(--text-muted-color);
		font-size: 0.92rem;
	}
</style>

Outside of research, I love taking photos of everyday moments and places I visit. I also enjoy spending time at baseball stadiums, cheering for great plays and soaking in the atmosphere with friends. This page is a small collection of those memories.

<p style="font-size: 0.85rem; color: var(--text-muted-color);">
  &copy; Jeongmin Park. All photos on this page are my own. Unauthorised reproduction, distribution, or use without explicit written permission is prohibited.
</p>

<section id="more-gallery" aria-label="Photo gallery">
	<figure class="photo-card">
		<img src="/assets/img/more/240803_pohang2.jpg" alt="Pohang sunset" loading="lazy">
		<figcaption>2024.08 - Pohang sky</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/240803_pohang1.jpg" alt="Pohang coast" loading="lazy">
		<figcaption>2024.08 - Pohang coast</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/240518.jpg" alt="May 2024" loading="lazy">
		<figcaption>2024.05 - At campus</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/240405_tickets.jpg" alt="Tickets" loading="lazy">
		<figcaption>2024.04 - LG (vs. KT, 240405)</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/240405_jamsil.jpg" alt="Jamsil" loading="lazy">
		<figcaption>2024.04 - LG (vs. KT, 240405)</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/240402_cherryblossoms.jpg" alt="Cherry blossoms" loading="lazy">
		<figcaption>2024.04 - Cherry blossoms</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/231216_kaistgoose.jpg" alt="KAIST goose" loading="lazy">
		<figcaption>2023.12 - Geese in KAIST</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/231016.jpg" alt="October 2023" loading="lazy">
		<figcaption>2023.10 - At campus</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/230815_busan.jpg" alt="Busan" loading="lazy">
		<figcaption>2023.08 - Busan</figcaption>
	</figure>

	<figure class="photo-card">
		<img src="/assets/img/more/221001_mt_gamak.jpg" alt="Mt. Gamak" loading="lazy">
		<figcaption>2022.10 - Mt. Gamak</figcaption>
	</figure>
</section>


